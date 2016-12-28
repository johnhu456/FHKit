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
- (UIImage *)fh_cutToRoundImageWithRadius:(CGFloat)radius;

/**
 *  Resize the image to a specific size
 *
 *  @param size The specific size
 *
 *  @return The resized image
 */
- (UIImage *)fh_scaleToSize:(CGSize)size;

/**
 Get screenshots of the view

 @param The UIView object to take a screenshot

 @return The screenshot,its size is same as the view's
 */
+ (UIImage *)fh_imageForSnapShotView:(UIView *)view;

/**
 Use CoreImage to blur with the image
 
 @param blur  Blur level,more bigger,more blurred.
 
 @return the blured image
 */
- (UIImage *)fh_coreBlurWithBlurLevel:(CGFloat)blur;
@end
