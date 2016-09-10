//
//  UIImage+FHExtension.h
//  FHKit
//
//  Created by MADAO on 16/8/25.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FHExtension)

/**
 *  Cut an image to a round image
 *
 *  @param radius The round's radius
 *
 *  @return The round image
 */
- (UIImage *)cutToRoundImageWithRadius:(CGFloat)radius;

/**
 *  Resize the image to a specific size
 *
 *  @param size The specific size
 *
 *  @return The resized image
 */
- (UIImage *)scaleToSize:(CGSize)size;

@end
