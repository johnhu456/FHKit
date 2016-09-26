//
//  ViewController.m
//  FHKit
//
//  Created by MADAO on 15/12/30.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import "ViewController.h"
#import "FHTool.h"
#import "FHLblWithInfoBtn.h"
#import "NSDate+FHExtension.h"
#import <stdarg.h>

@interface ViewController ()

@property (nonatomic, strong) NSArray *characterArray;
@end

@implementation ViewController

- (NSArray *)characterArray
{
    return @[@"%a",@"%A",@"%b",@"%B",@"%c",@"%d",@"%H",@"%I",@"%j",@"%m",@"%M",@"%p",@"%S",@"%u",@"%w",@"%x",@"%X",@"%y",@"%Y",@"%Z"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:colorView];
    colorView.backgroundColor = FHColorWithHexRGB(0x000000);

    
    FHLblWithInfoBtn *infoBtn = [[FHLblWithInfoBtn alloc] initWithFrame:CGRectMake(20, 20, 100, 20) title:@"sdafs" image:[UIImage imageNamed:@"calculate_img_chart_hydt"] handler:^{
        NSLog(@"selelelelel");
    }];
    infoBtn.lblTitle.textColor = [UIColor blackColor];
    [self.view addSubview:infoBtn];
    
    UILabel *label =[[ UILabel alloc] init];
    label.textAlignment = FHTextAlignmentCenter;
    
    NSDate *date = [NSDate date];
    for (NSString *form in self.characterArray) {
        NSString *str = [date strfTimeStringWithFormat:form];
        NSLog(@"%@",str);
    }
    
    NSDate *date2 = [NSDate date];
    NSString *str1 = [date2 strfTimeStringWithFormat:@"%Y-%m-%dT%H:%M:%S%z"];
    NSDate *date3 = [NSDate strpDateWithFormatString:str1 inFormat:@"%Y-%m-%dT%H:%M:%S%z"];
    NSLog(@"%@",date3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
