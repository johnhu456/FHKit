//
//  FHThreadWatcher.m
//  FHKit
//
//  Created by John on 2017/12/16.
//  Copyright © 2017年 MADAO. All rights reserved.
//

#import "FHThreadWatcher.h"
#import <signal.h>
#import <pthread.h>
#import <execinfo.h>
static pthread_t mainThreadID;
static NSString *const kMainThreadPingNotification = @"kMainThreadPingNotification";
static NSString *const kMainThreadPongNotification = @"kMainThreadPongNotification";

static void threadKilledHandler(int sig) {
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

@property (nonatomic, assign) void(^warningHandler)(NSArray <NSString *> *);

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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleReceivedPingNotification:) name:kMainThreadPingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleReceivedPongNotification:) name:kMainThreadPongNotification object:nil];
    }
    return self;
}

#pragma mark - PublicMethod
- (void)startWatchWithWarningHandler:(void (^)(NSArray<NSString *> *))handler {
    self.warningHandler = handler;
    //Must called from a main thread
    NSAssert([NSThread currentThread].isMainThread, @"startWatch must called from a main thread");
    
    //Register a signal handler
    signal(SIGUSR1, threadKilledHandler);
    
    mainThreadID = pthread_self();
    [self startPing];
}

#pragma mark - PublicMethod
- (void)startPing {
    self.pingTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(self.pingTimer, dispatch_walltime(NULL, self.watchInterval * NSEC_PER_SEC), self.watchInterval * NSEC_PER_SEC, self.warningInterval * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.pingTimer, ^{
        [self startPong];
    });
    dispatch_resume(self.pingTimer);
}

- (void)startPong {
    self.pongTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(self.pongTimer, dispatch_walltime(NULL, self.warningInterval * NSEC_PER_SEC), self.warningInterval * NSEC_PER_SEC, self.warningInterval * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.pongTimer, ^{
        [self handleMainThreadTimeOut];
    });
    dispatch_resume(self.pongTimer);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kMainThreadPingNotification object:nil];
    });
}

- (void)handleMainThreadTimeOut {
    if (self.warningHandler) {
//        NSLog(@"%@",[NSThread callStackSymbols]);
//        NSLog(@"%@",[NSThread callStackSymbols]);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            int j, nptrs;
//#define SIZE 100
//            void *buffer[100];
//            char **strings;
//
//            nptrs = backtrace(buffer, SIZE);
//            printf("backtrace() returned %d addresses\n", nptrs);
//
//            /* The call backtrace_symbols_fd(buffer, nptrs, STDOUT_FILENO)
//             would produce similar output to the following: */
//
//            strings = backtrace_symbols(buffer, nptrs);
//            if (strings == NULL) {
//                perror("backtrace_symbols");
//                exit(EXIT_FAILURE);
//            }
//
//            for (j = 0; j < nptrs; j++)
//                printf("%s\n", strings[j]);
//
//            free(strings);
//        });
        
//        NSString *stirng = [[NSString alloc] initWithUTF8String:*backtrace_symbols(xaddr, 30)];
//        NSLog(@"%@\n=================",stirng);
//        self.warningHandler([NSThread callStackSymbols]);
    }
    threadKiller();
}

#pragma mark - Notification

- (void)handleReceivedPingNotification:(NSNotification *)notification {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kMainThreadPongNotification object:nil];
    });
}

- (void)handleReceivedPongNotification:(NSNotification *)notification {
    if (self.pongTimer) {
        dispatch_source_cancel(self.pongTimer);
        self.pongTimer = nil;
    }
}

@end
