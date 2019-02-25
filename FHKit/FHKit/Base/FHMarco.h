//
//  FHMarco.h
//  FHKit
//
//  Created by MADAO on 16/8/25.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#ifndef FHKIT_MARCO
#define FHKIT_MARCO

/*==================Font=========================*/
#define FHFontSystemSize(x) [UIFont systemFontOfSize:x]

/*==================Color========================*/
#define FHColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]
#define FHColorWithRGB(r,g,b) FHColorWithRGBA(r,g,b,1.f)
#define FHColorWithHexRGBA(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]
#define FHColorWithHexRGB(hexValue) FHColorWithHexRGBA(hexValue,1)

/*==================Image=========================*/
#define ImageInName(name) [UIImage imageNamed:name]

/*==================Layout=========================*/
#define HEIGHT_1PX (1.f/[UIScreen mainScreen].scale)

/*==================Identifier====================*/
#define StrFromClass(aClass) NSStringFromClass([aClass class])
#define NibFromClass(aClass) [UINib nibWithNibName:NSStringFromClass([aClass class]) bundle:nil]

/*==================Log===========================*/
#ifndef __OPTIMIZE__
# define MYLog(format,...) NSLog((@ "%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
# define MYLog(...)
#endif

/*==================OSVersion=====================*/
#define FHiOSVersion [[UIDevice currentDevice] systemVersion]
#define FHiOS6After floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_0
#define FHiOS7After floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_0
#define FHiOS8After floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_0

/*==================WeakSelf=====================*/
/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
*/
/*From YYCategories*/
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#endif

/*==================Else=====================*/
#define MEPKeyPath(t, s) ((NO && ((void)t.s, NO)), @#s)
