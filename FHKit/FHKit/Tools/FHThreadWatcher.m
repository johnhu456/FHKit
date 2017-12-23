//
//  FHThreadWatcher.m
//  FHKit
//
//  Created by John on 2017/12/16.
//  Copyright © 2017年 MADAO. All rights reserved.
//

#import "FHThreadWatcher.h"
#import "BSBacktraceLogger.h"
#import <signal.h>
#import <pthread.h>
#import <execinfo.h>
static pthread_t mainThreadID;

static void threadKilledHandler(int sig) {
    //This code only works when set 'pro hand -p true -s false SIGUSR1' in lldb
    NSLog(@"Ops, something stucked on main thread:\n========================");
    for (NSString *callStack in [NSThread callStackSymbols]) {
        NSLog(@"%@",callStack);
    }
    NSLog(@"========================");
}

static void threadKiller() {
    pthread_kill(mainThreadID, SIGUSR1);
}

@interface FHThreadWatcher()

@property (nonatomic, strong) dispatch_source_t pingTimer;
@property (nonatomic, strong) dispatch_source_t pongTimer;
@property (nonatomic, strong) NSNumber *startTime;
@property (nonatomic, strong) NSNumber *endTime;

@property (nonatomic, copy) void(^runLoopCallBack)(CFRunLoopObserverRef observer, CFRunLoopActivity activity);
@property (nonatomic, copy) void(^warningHandler)(NSString *);

@end

@implementation FHThreadWatcher

#pragma mark - LifeCycle
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static FHThreadWatcher *_sharedWatcher;
    dispatch_once(&onceToken, ^{
        _sharedWatcher = [[FHThreadWatcher alloc] init];
        _sharedWatcher.watchInterval = 1.f;
        _sharedWatcher.warningInterval = 16/1000.f;
    });
    return _sharedWatcher;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - PublicMethod
- (void)startWatchWithWarningHandler:(void (^)(NSString *))handler {
    self.warningHandler = handler;
    [self setupRunloopObserver];
}

#pragma mark - PrivateMethod

- (void)setupRunloopObserver
{
    //Register a signal handler
    dispatch_async(dispatch_get_main_queue(), ^{
        mainThreadID = pthread_self();
        signal(SIGUSR1, threadKilledHandler);
    });

    //Add runloop observer
    __weak typeof(self) weakSelf = self;
    self.runLoopCallBack = ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopBeforeWaiting:
                NSLog(@"beforeWaiting");
                weakSelf.endTime = @([[NSDate date] timeIntervalSinceReferenceDate]);
                break;
            case kCFRunLoopAfterWaiting:
                weakSelf.endTime = nil;
                weakSelf.startTime = @([[NSDate date] timeIntervalSinceReferenceDate]);
                NSLog(@"afterWaiting");
                break;
            default:
                break;
        }
    };
    CFRunLoopRef runLoop = CFRunLoopGetMain();
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, self.runLoopCallBack);
    CFRunLoopAddObserver(runLoop, observer, kCFRunLoopCommonModes);
    
    //Create detecter
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, self.watchInterval * NSEC_PER_SEC, self.warningInterval * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (self.startTime == nil)
            return;
        if (self.endTime != nil)
            return;
        if ([[NSDate date] timeIntervalSinceReferenceDate] - weakSelf.startTime.doubleValue > 16/1000.f)
        {
            if (self.warningHandler) {
                self.warningHandler([BSBacktraceLogger bs_backtraceOfMainThread]);
            }
                threadKiller();
        }
    });
    dispatch_resume(timer);
    self.pingTimer = timer;
}

@end
