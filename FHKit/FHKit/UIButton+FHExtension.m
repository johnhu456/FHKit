//
//  UIButton+FHExtension.m
//  FHKit
//
//  Created by MADAO on 16/2/17.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "UIButton+FHExtension.h"
#import "FHTool.h"

@implementation UIButton (Extension)

+ (UIButton *)customButtonWithTitle:(NSString *)title
{
    return [UIButton customButtonWithTitle:title font:nil];
}

+ (UIButton *)customButtonWithTitle:(NSString *)title font:(UIFont *)font
{
    NSAssert([title length] > 0, @"Custom Title can not be nil");
    UIButton *resultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [resultButton setTitle:title forState:UIControlStateNormal];
    
    if (font) {
        resultButton.titleLabel.font = font;
    }
    CGSize titleSize = FHGetTextSize(resultButton.titleLabel.text, resultButton.titleLabel.font);
    resultButton.frame = (CGRect){CGPointZero, titleSize};
    
    return resultButton;
}

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage
{
    return [UIButton customButtonWithDefaultImage:defaultImage
                                 highlightedImage:nil
                                    selectedImage:nil
                                    disabledImage:nil];
}

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage
                          highlightedImage:(UIImage *)highlightedImage
{
    return [UIButton customButtonWithDefaultImage:defaultImage
                                 highlightedImage:highlightedImage
                                    selectedImage:nil
                                    disabledImage:nil];
}

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage
                          highlightedImage:(UIImage *)highlightedImage
                             selectedImage:(UIImage *)selectedImage
{
    return [UIButton customButtonWithDefaultImage:defaultImage
                                 highlightedImage:highlightedImage
                                    selectedImage:selectedImage
                                    disabledImage:nil];
}

+ (UIButton *)customButtonWithDefaultImage:(UIImage *)defaultImage
                          highlightedImage:(UIImage *)highlightedImage
                             selectedImage:(UIImage *)selectedImage
                             disabledImage:(UIImage *)disabledImage
{
    NSAssert(defaultImage != nil, @"Custom defaultImage can not be nil");
    UIButton *resultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    resultButton.frame = (CGRect){CGPointZero, defaultImage.size};
    
    [resultButton setImage:defaultImage forState:UIControlStateNormal];
    if (highlightedImage) {
        [resultButton setImage:highlightedImage forState:UIControlStateHighlighted];
        resultButton.adjustsImageWhenHighlighted = NO;
    }
    if (selectedImage) {
        [resultButton setImage:selectedImage forState:UIControlStateSelected];
    }
    if (disabledImage) {
        [resultButton setImage:disabledImage forState:UIControlStateDisabled];
        resultButton.adjustsImageWhenDisabled = NO;
    }
    
    return resultButton;
}

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage
{
    return [UIButton customButtonWithTitle:title
                    defaultBackgroundImage:defaultImage
                highlightedBackgroundImage:nil
                   selectedBackgroundImage:nil
                   disabledBackgroundImage:nil];
}

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage
         highlightedBackgroundImage:(UIImage *)highlightedImage
{
    return [UIButton customButtonWithTitle:title
                    defaultBackgroundImage:defaultImage
                highlightedBackgroundImage:highlightedImage
                   selectedBackgroundImage:nil
                   disabledBackgroundImage:nil];
}

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage
            selectedBackgroundImage:(UIImage *)selectedImage
{
    return [UIButton customButtonWithTitle:title
                    defaultBackgroundImage:defaultImage
                highlightedBackgroundImage:nil
                   selectedBackgroundImage:selectedImage
                   disabledBackgroundImage:nil];
}

+ (UIButton *)customButtonWithTitle:(NSString *)title
             defaultBackgroundImage:(UIImage *)defaultImage
         highlightedBackgroundImage:(UIImage *)highlightedImage
            selectedBackgroundImage:(UIImage *)selectedImage
            disabledBackgroundImage:(UIImage *)disabledImage
{
    NSAssert(defaultImage != nil, @"Custom defaultImage can not be nil");
    UIButton *resultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    resultButton.frame = (CGRect){CGPointZero, defaultImage.size};
    
    [resultButton setTitle:title forState:UIControlStateNormal];
    
    [resultButton setBackgroundImage:defaultImage forState:UIControlStateNormal];
    
    if (highlightedImage) {
        [resultButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
        resultButton.adjustsImageWhenHighlighted = NO;
    }
    if (selectedImage) {
        [resultButton setBackgroundImage:selectedImage forState:UIControlStateSelected];
    }
    if (disabledImage) {
        [resultButton setBackgroundImage:disabledImage forState:UIControlStateDisabled];
        resultButton.adjustsImageWhenDisabled = NO;
    }
    
    return resultButton;
}

@end
