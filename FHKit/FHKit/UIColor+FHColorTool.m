//
//  UIColor+FHColorTool.m
//  FHColorTool
//
//  Created by MADAO on 15/12/29.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import "UIColor+FHColorTool.h"

@implementation UIColor (FHColorTool)

+ (instancetype)fh_ColorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f
                           green:green/255.f
                            blue:blue/255.f
                           alpha:alpha];
}

+ (instancetype)fh_ColorWithHexRGB:(int)rgb
{
    return [UIColor fh_ColorWithR:((rgb & 0xFF0000) >> 16)
                                G:((rgb & 0xFF00) >> 8)
                                B:((rgb & 0xFF)) alpha:1];
}
@end
