//
//  FHThreadWatcher.h
//  FHKit
//
//  Created by 胡翔 on 2017/12/16.
//  Copyright © 2017年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHThreadWatcher : NSObject

/**
 FHThreadWatcher watch interva.The smaller the interval, check the main thread more frequently.
 Default is 1 second
 */
@property (nonatomic, assign, readwrite) NSTimeInterval watchInterval;

/**
 Main thread warning time interval, when the main thread stuck longer than the warning interval, FHThreadWatcher will throw warnning info.
 Default is 16/1000 second
 */
@property (nonatomic, assign, readwrite) NSTimeInterval warningInterval;

+ (instancetype)sharedInstance;

/**
 Start to watch main thread

 @param handler A block object called when main thread stuck more than warning time interval.
                Param callStack contains the call stack before main thread get stuck.
 */
- (void)startWatchWithWarningHandler:(void(^)(NSArray <NSString *> *callStack))handler;

@end
