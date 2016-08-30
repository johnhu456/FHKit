//
//  FHTool.h
//  FHColorTool
//
//  Created by MADAO on 15/12/29.
//  Copyright © 2015年 MADAO. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "Foundation+Log.m"
#import "FHMarco.h"

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
