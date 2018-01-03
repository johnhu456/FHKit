//
//  NSObject+FHCat.h
//  FHKit
//
//  Created by 胡翔 on 2017/12/28.
//  Copyright © 2017年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FHCat)

#pragma mark - Runtime
- (void)addDynamicProperty:(NSString *)propertyName
                     value:(id)value
                    strong:(BOOL)isStrong;

- (nullable id)dynamicPropertyWithName:(NSString *)propertyName;

+ (BOOL)swizzleInstanceOriginalMethod:(SEL)original
                          withAnother:(SEL)another OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);

+ (BOOL)swizzleClassOriginalMethod:(SEL)original
                       withAnother:(SEL)another OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);

#pragma mark - KVO
- (void)addObserverForKeyPath:(NSString *)keyPath
              observerHandler:(void(^)(id oldValue, id newValue, NSString *keyPath))handler;

@end

NS_ASSUME_NONNULL_END
