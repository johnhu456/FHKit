//
//  FHCustomTF.m
//  FHColorTool
//
//  Created by MADAO on 15/12/29.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import "FHCustomTF.h"

#define FHTF_HEIGHT 45.f

@implementation FHCustomTF
- (instancetype)initWithTip:(NSString *)tip
                placeholder:(NSString *)placeholder
                buttonTitle:(NSString *)title
               textViewType:(FHCustomTFType)type
{
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    if (self = [super initWithFrame:CGRectMake(0, 0, window.frame.size.width, FHTF_HEIGHT)]) {
        self.backgroundColor  = [UIColor whiteColor];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.rightViewMode = UITextFieldViewModeAlways;
        
        /**Setup LeftView*/
        if (tip != nil) {
            self.lblLeftTip = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, FHTF_HEIGHT * 2, FHTF_HEIGHT)];
            self.lblLeftTip.text = tip;
            self.lblLeftTip.textColor = [UIColor darkGrayColor];
            self.lblLeftTip.textAlignment = NSTextAlignmentCenter;
            self.lblLeftTip.font = [UIFont systemFontOfSize:15];
            self.leftView = self.lblLeftTip;
        }
        
        /**Setup RightView*/
        if (title != nil) {
            self.btnRightCustom = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, FHTF_HEIGHT * 2, FHTF_HEIGHT)];
            self.btnRightCustom.backgroundColor = [UIColor blackColor];
            [self.btnRightCustom setTitle:title forState:UIControlStateNormal];
            [self.btnRightCustom addTarget:self
                                    action:@selector(btnCustomOnClicked:)
                          forControlEvents:UIControlEventTouchUpInside];
            self.rightView = self.btnRightCustom;
        }
        
        /**Setup TextField*/
        self.borderStyle = UITextBorderStyleNone;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.autocapitalizationType = UITextAutocorrectionTypeNo;
        self.placeholder = placeholder;
        [self setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        switch (type) {
            case FHCustomTFTypeDefault:
                break;
            case FHCustomTFTypeNumOnly:
                self.keyboardType  = UIKeyboardTypeNumberPad;
                break;
            case FHCustomTFTypePassword:
                self.secureTextEntry = YES;
                break;
            default:
                break;
        }
    }
    return self;
}
#pragma mark - Action

- (void)btnCustomOnClicked:(UIButton *)sender
{
    [self.fhCusotmTFDelegate customTFRightButtonOnClick:sender];
}
@end
