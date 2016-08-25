//
//  UIImage+FHExtension.h
//  FHKit
//
//  Created by MADAO on 16/8/25.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FHExtension)

/**裁剪成圆*/
- (UIImage *)cutToRoundImageWithRadius:(CGFloat)radius;

@end
