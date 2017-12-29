//
//  NSObject+FHCat.m
//  FHKit
//
//  Created by 胡翔 on 2017/12/28.
//  Copyright © 2017年 MADAO. All rights reserved.
//

#import "NSObject+FHCat.h"
#import <objc/runtime.h>

@implementation NSObject (FHCat)

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

@end
