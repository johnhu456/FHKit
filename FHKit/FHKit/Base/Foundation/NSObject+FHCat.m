//
//  NSObject+FHCat.m
//  FHKit
//
//  Created by 胡翔 on 2017/12/28.
//  Copyright © 2017年 MADAO. All rights reserved.
//

#import "NSObject+FHCat.h"
#import <objc/runtime.h>

typedef void(^KVOHandler)(id oldValue, id newValue, NSString *keyPath);

#pragma mark - FHKVOTarget
@interface FHKVOObserver : NSObject

@property (nonatomic, copy) KVOHandler handler;

- (instancetype)initWithHandler:(KVOHandler)handler;

@end

@implementation FHKVOObserver

- (instancetype)initWithHandler:(KVOHandler)handler {
    if (self = [super init]) {
        self.handler = handler;
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (!self.handler) return;
    
    BOOL isPrior = [[change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
    if (isPrior) return;
    
    NSKeyValueChange changeKind = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    if (changeKind != NSKeyValueChangeSetting)
        return;
    
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldValue == [NSNull null]) oldValue = nil;
    
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    if (newValue == [NSNull null]) newValue = nil;
    
    self.handler(oldValue,newValue,keyPath);
}
@end

static NSString *const kObserversDictionary = @"kObserversDictionary";       //Observers dictionary

@implementation NSObject (FHCat)

#pragma mark - Runtime
- (void)setDynamicProperty:(NSString *)propertyName value:(id)value strong:(BOOL)isStrong {
    if (value) {
        objc_AssociationPolicy strongPolicy = isStrong ? OBJC_ASSOCIATION_RETAIN_NONATOMIC : OBJC_ASSOCIATION_ASSIGN;
        objc_setAssociatedObject(self, CFBridgingRetain(propertyName), value, strongPolicy);
    }
}

- (id)dynamicPropertyWithName:(NSString *)propertyName {
    return objc_getAssociatedObject(self, CFBridgingRetain(propertyName));
}

+ (BOOL)swizzleInstanceOriginalMethod:(SEL)original withAnother:(SEL)another {
    Class cls = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(cls, original);
    Method anotherMethod = class_getInstanceMethod(cls, another);
    if(!originalMethod || anotherMethod)
        return NO;
    //Add these two instance methods first rather than swizzle them directly. This could prevent from 'Unrecognized selector'.
    class_addMethod(cls, original, class_getMethodImplementation(cls, original), method_getTypeEncoding(originalMethod));
    class_addMethod(cls, another, class_getMethodImplementation(cls, another), method_getTypeEncoding(anotherMethod));
    method_exchangeImplementations(originalMethod, anotherMethod);
    return YES;
}

+ (BOOL)swizzleClassOriginalMethod:(SEL)original withAnother:(SEL)another {
    Class cls = object_getClass(self);
    Method originalMethod = class_getClassMethod(cls, original);
    Method anotherMethod = class_getClassMethod(cls, another);
    if(!originalMethod || anotherMethod)
        return NO;
    method_exchangeImplementations(originalMethod, anotherMethod);
    return YES;
}

#pragma mark - KVO
- (void)addObserverForKeyPath:(NSString *)keyPath observerHandler:(void (^)(id _Nonnull, id _Nonnull, NSString * _Nonnull))handler {
    FHKVOObserver *observer = [[FHKVOObserver alloc] initWithHandler:handler];
    NSMutableDictionary *observerDic = [self getObserversDictionary];
    if ([observerDic.allKeys containsObject:keyPath]) {
        //Had an array
        NSMutableArray *keyObservers = (NSMutableArray *)observerDic[keyPath];
        [keyObservers addObject:observer];
    } else {
        NSMutableArray *keyObservers = [[NSMutableArray alloc] init];
        [keyObservers addObject:observer];
        [observerDic setObject:keyObservers forKey:keyPath];
    }
    [self addObserver:observer forKeyPath:keyPath options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
}

- (NSMutableDictionary *)getObserversDictionary {
    if ([[self dynamicPropertyWithName:kObserversDictionary] isKindOfClass:[NSMutableDictionary class]]) {
        return [self dynamicPropertyWithName:kObserversDictionary];
    }
    else {
        NSMutableDictionary *newDic = [[NSMutableDictionary alloc] init];
        [self setDynamicProperty:kObserversDictionary value:newDic strong:YES];
        return newDic;
    }
}

@end
