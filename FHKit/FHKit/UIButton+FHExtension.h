//
//  UIButton+FHExtension.h
//  FHKit
//
//  Created by MADAO on 16/2/17.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (UIButton *)customButtonWithTitle:(NSString *)title;
+ (UIButton *)customButtonWithTitle:(NSString *)title font:(UIFont *)font;

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage;

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage
                          highlightedImage:(UIImage *)highlightedImage;

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage
                          highlightedImage:(UIImage *)highlightedImage
                             selectedImage:(UIImage *)selectedImage;

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage
                          highlightedImage:(UIImage *)highlightedImage
                             selectedImage:(UIImage *)selectedImage
                             disabledImage:(UIImage *)disabledImage;

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage;

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage
         highlightedBackgroundImage:(UIImage *)highlightedImage;

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage
            selectedBackgroundImage:(UIImage *)selectedImage;

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage
         highlightedBackgroundImage:(UIImage *)highlightedImage
            selectedBackgroundImage:(UIImage *)selectedImage
            disabledBackgroundImage:(UIImage *)disabledImage;

@end
