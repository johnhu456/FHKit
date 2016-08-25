//
//  FHTool.h
//  FHColorTool
//
//  Created by MADAO on 15/12/29.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Foundation+Log.m"
#import <objc/runtime.h>

#pragma mark - Font

#define FHFontSystemSize(x) [UIFont systemFontOfSize:x]

#pragma mark - Color

#define FHColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]
#define FHColorWithRGB(r,g,b) FHColorWithRGBA(r,g,b,1.f)
#define FHColorWithHexRGBA(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]
#define FHColorWithHexRGB(hexValue) FHColorWithHexRGBA(hexValue,1)

#pragma mark - WeakSelf

#define WEAKSELF autoreleasepool{} __weak typeof(self) weakSelf = self;

#define WEAK_OBJ(o) autoreleasepool{} __weak typeof(o) o##Weak = o;

#pragma mark - Log

#ifndef __OPTIMIZE__
# define MYLog(format,...) NSLog((@ "%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
# define MYLog(...)
#endif

#pragma mark - OSVersionCompile

#define FHiOS6After floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_0
#define FHiOS7After floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_0
#define FHiOS8After floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_0

/**文字对齐方式*/
#ifdef __IPHONE_6_0
    #define FHTextAlignmentCenter NSTextAlignmentCenter
    #define FHTextAlignmentLeft NSTextAlignmentLeft
    #define FHTextAlignmentRight NSTextAlignmentRight
#else
    #define FHTextAlignmentCenter UITextAlignmentCenter
    #define FHTextAlignmentLeft UITextAlignmentLeft
    #define FHTextAlignmentRight UITextAlignmentRight
#endif

/**文字大小*/
#ifdef __IPHONE_7_0
    #define FHGetTextSize(text, font) [text length] > 0 ? [text \
    sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero
#else
    #define FHGetTextSize(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero
#endif

/**获取最大的文字大小*/
#if __IPHONE_OS_VERSION_MAX_REQUIRED >= __IPHONE_7_0
    #define FHGetMaxTextSize(text,maxSize,font) [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil]
#endif

#pragma mark - Runtime

/**动态获取类的属性*/
#define GET_IVAR_WITH_CLASS(x) NSLog(@"Getting Ivar List In Class:%@================",NSStringFromClass(x));\
                                unsigned int count1 = 0;\
                                Ivar *var1 = class_copyIvarList([x class], &count1);\
                                for (int i = 0 ;i < count1 ;i++) {\
                                Ivar _var = *(var1 + i);\
                                NSLog(@"Name:%s----- Type:%s",ivar_getName(_var),ivar_getTypeEncoding(_var));\
}

@interface FHTool : NSObject

/**获取当前Window对象*/
+ (UIWindow *)getCurrentWindow;

/**获取屏幕宽度*/
+ (CGFloat)getScreenWidth;

/**获取屏幕高度*/

+ (CGFloat)getScreenHeight;

/**获取对象所有的Value值，打印输出*/
+ (void)getAllIvarValueWithObject:(id)obj;

#pragma makr - NSArraySort
/**排列数组*/
+ (NSArray *)sortUsingDescriptorDictionary:(NSDictionary *)descriptorDic withArray:(NSArray *)sortArray;

@end
