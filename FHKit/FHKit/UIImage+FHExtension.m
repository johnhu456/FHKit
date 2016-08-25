//
//  UIImage+FHExtension.m
//  FHKit
//
//  Created by MADAO on 16/8/25.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "UIImage+FHExtension.h"

@implementation UIImage (FHExtension)

- (UIImage *)cutToRoundImageWithRadius:(CGFloat)radius
{
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 绘制圆
    CGPoint center = CGPointMake(self.size.width / 2, self.size.height / 2);
    UIBezierPath *outPath = [UIBezierPath bezierPathWithArcCenter:center radius:self.size.width/2 startAngle:0 endAngle:2*M_PI clockwise:YES];
    CGContextAddPath(context, outPath.CGPath);
    // 剪裁
    CGContextClip(context);
    
    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
