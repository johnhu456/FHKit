//
//  ViewController.m
//  FHKit
//
//  Created by MADAO on 15/12/30.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+FHColorTool.h"
#import "FHCustomTF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:colorView];
    colorView.backgroundColor = [UIColor fh_colorWithFFStyleRGB:0x000000];
    
    
    FHCustomTF *textField = [[FHCustomTF alloc] initWithTip:@"手机号码"
                                                placeholder:@"请输入手机号码"
                                                buttonTitle:@"XXX"
                                               textViewType:FHCustomTFTypeNumOnly];
    textField.center = CGPointMake(200, 200);
    
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
