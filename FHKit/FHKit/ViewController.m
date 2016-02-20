//
//  ViewController.m
//  FHKit
//
//  Created by MADAO on 15/12/30.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import "ViewController.h"
#import "FHTool.h"
#import "FHOSVersionTool.h"
#import "UIColor+FHColorTool.h"
#import "FHLblWithInfoBtn.h"
#import <stdarg.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:colorView];
    colorView.backgroundColor = [UIColor fh_colorWithFFStyleRGB:0x000000];

    
    FHLblWithInfoBtn *infoBtn = [[FHLblWithInfoBtn alloc] initWithFrame:CGRectMake(20, 20, 100, 20) title:@"sdafs" image:[UIImage imageNamed:@"calculate_img_chart_hydt"] handler:^{
        NSLog(@"selelelelel");
    }];
    infoBtn.lblTitle.textColor = [UIColor blackColor];
    [self.view addSubview:infoBtn];
    
    UILabel *label =[[ UILabel alloc] init];
    label.textAlignment = FHTextAlignmentCenter;
    IF_IOS7_OR_GREATER(NSLog(@"HAHAHA");)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
