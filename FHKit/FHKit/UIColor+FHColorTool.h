//
//  UIColor+FHColorTool.h
//  FHColorTool
//
//  Created by MADAO on 15/12/29.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FHColorTool)

/**RGB生成模式*/
+ (instancetype)fh_ColorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha;

/**HEX(16进制)*/
+ (instancetype)fh_ColorWithHexRGB:(int)rgb;

@end
