//
//  FHAlertController.m
//  FHAlertController
//
//  Created by MADAO on 16/4/1.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "FHAlertController.h"

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface FHAlertController ()

@property (nonatomic, strong) NSMutableArray *actionsArray;

@end

@implementation FHAlertController

- (void)setFhAttributedTitle:(NSAttributedString *)fhAttributedTitle
{
    [self setValue:fhAttributedTitle forKeyPath:@"_attributedTitle"];
}

- (void)setFhAttributedMessage:(NSAttributedString *)fhAttributedMessage
{
    [self setValue:fhAttributedMessage forKeyPath:@"_attributedMessage"];
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor
{
    _buttonTitleColor = buttonTitleColor;
    for (id obj in self.actions) {
        FHAlertAction *action = (FHAlertAction *)obj;
        [action setFhTitleColor:buttonTitleColor];
    }
}

- (void)addAction:(UIAlertAction *)action
{
    [super addAction:action];
    [self.actionsArray addObject:action];
}

- (void)addActionArray:(NSArray *)actionArray
{
    for (id obj in actionArray) {
        NSAssert([obj isKindOfClass:[UIAlertAction class]],@"obj in Array is not kind of class : UIAlertAction");
        [self addAction:obj];
    }
}
@end

@implementation FHAlertAction
- (void)setFhTitleColor:(UIColor *)fhTitleColor
{
    _fhTitleColor = fhTitleColor;
    [self setValue:_fhTitleColor forKeyPath:@"_titleTextColor"];
}

- (void)setFhDescriptiveText:(NSString *)fhDescriptiveText
{
    _fhDescriptiveText = fhDescriptiveText;
    [self setValue:fhDescriptiveText forKeyPath:@"__descriptiveText"];
}

- (void)setFhKeyCommandInput:(NSString *)fhKeyCommandInput
{
    _fhKeyCommandInput = fhKeyCommandInput;
    [self setValue:fhKeyCommandInput forKeyPath:@"_keyCommandInput"];
}
- (void)setFhTitleTextAlignment:(NSTextAlignment)fhTitleTextAlignment
{
    _fhTitleTextAlignment = fhTitleTextAlignment;
    [self setValue:@(fhTitleTextAlignment) forKey:@"_titleTextAlignment"];
}

- (void)setFhImage:(UIImage *)fhImage
{
    _fhImage = fhImage;
    [self setValue:fhImage forKeyPath:@"_image"];
}

- (void)setFhImageTintColor:(UIColor *)fhImageTintColor
{
    _fhImageTintColor = fhImageTintColor;
    [self setValue:fhImageTintColor forKeyPath:@"_imageTintColor"];
}

- (void)setFhEnabled:(BOOL)fhEnabled
{
    _fhEnabled = fhEnabled;
    [self setValue:@(fhEnabled) forKeyPath:@"_enabled"];
}

- (void)setFhChecked:(BOOL)fhChecked
{
    _fhChecked = fhChecked;
    [self setValue:@(fhChecked) forKeyPath:@"_fhChecked"];
}

- (void)setFhIsPreferred:(BOOL)fhIsPreferred
{
    _fhIsPreferred = fhIsPreferred;
    [self setValue:@(fhIsPreferred) forKeyPath:@"_fhIsPreferred"];
}
@end