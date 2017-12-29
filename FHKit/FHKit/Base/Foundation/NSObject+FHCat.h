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

+ (BOOL)swizzleInstanceOriginalMethod:(SEL)original withAnother:(SEL)another OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);

+ (BOOL)swizzleClassOriginalMethod:(SEL)original withAnother:(SEL)another OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);

@end

NS_ASSUME_NONNULL_END
