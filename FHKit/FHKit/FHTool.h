//
//  FHTool.h
//  FHColorTool
//
//  Created by MADAO on 15/12/29.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UIView+Frame.h"

#pragma mark - 字体部分

#define FH_FONT_SYSTEM_WITH_SIZE(x) [UIFont systemFontOfSize:x]
#define FH_FONT_THIN_WITH_SIZE(x) [UIFont fontWithName:@"STHeitiSC-Light" size:x]

#pragma mark - 颜色部分

#define FH_ColorWith(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

#pragma mark - WeakSelf

#define WEAK_SELF __weak typeof(self) weakSelf = self 

#pragma mark - Debug

#ifndef __OPTIMIZE__
# define MYLog(...) NSLog(__VA_ARGS__)
#else
# define MYLog(...)
#endif

#pragma mark - OSVersionCompile
/**文字对齐方式适应版本*/
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
    #define FHTextAlignmentCenter NSTextAlignmentCenter
    #define FHTextAlignmentLeft NSTextAlignmentLeft
    #define FHTextAlignmentRight NSTextAlignmentRight
#else
    #define FHTextAlignmentCenter UITextAlignmentCenter
    #define FHTextAlignmentLeft UITextAlignmentLeft 
    #define FHTextAlignmentRight UITextAlignmentRight
#endif

/**文字大小*/
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    #define FH_TEXTSIZE(text, font) [text length] > 0 ? [text \
    sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
    #define FH_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

@interface FHTool : NSObject

/**获取当前Window对象*/
+ (UIWindow *)getCurrentWindow;

@end
