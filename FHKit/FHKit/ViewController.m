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
#import "FHThreadWatcher.h"
#import "NSObject+FHCat.h"
#import "NSString+FHCat.h"
#import "FHDESOperator.h"
#import <stdarg.h>

@interface ViewController ()

@property (nonatomic, strong) NSArray *characterArray;
@property (nonatomic, strong) NSTimer*                 busyJobTimer;
@end
typedef struct{
    int height;
}Mytest;

@implementation ViewController
- (NSArray *)characterArray
{
    return @[@"%a",@"%A",@"%b",@"%B",@"%c",@"%d",@"%H",@"%I",@"%j",@"%m",@"%M",@"%p",@"%S",@"%u",@"%w",@"%x",@"%X",@"%y",@"%Y",@"%Z"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    @try {}
    @finally{}
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:colorView];
    colorView.backgroundColor = FHColorWithHexRGB(0x000000);

    
    FHLblWithInfoBtn *infoBtn = [[FHLblWithInfoBtn alloc] initWithFrame:CGRectMake(20, 20, 100, 20) title:@"sdafs" image:[UIImage imageNamed:@"calculate_img_chart_hydt"] handler:^{
        NSLog(@"selelelelel");
    }];
    infoBtn.lblTitle.textColor = [UIColor blackColor];
    [self.view addSubview:infoBtn];
    
    UILabel *label =[[ UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    [label addObserverForKeyPath:@"text" observerHandler:^(id  _Nonnull oldValue, id  _Nonnull newValue, NSString * _Nonnull keyPath) {
        NSLog(@"%@ %@ %@",newValue,oldValue,keyPath);
        NSLog(@"%@ %@ %@",newValue,oldValue,keyPath);
    }];
    label.text = @"11";
    
//    NSDate *date = [NSDate date];
//    for (NSString *form in self.characterArray) {
//        NSString *str = [date strfTimeStringWithFormat:form];
//        NSLog(@"%@",str);
//    }
//
//    NSDate *date2 = [NSDate date];
//    NSString *str1 = [date2 strfTimeStringWithFormat:@"%Y-%m-%dT%H:%M:%S%z"];
//    NSDate *date3 = [NSDate strpDateWithFormatString:str1 inFormat:@"%Y-%m-%dT%H:%M:%S%z"];
//    NSLog(@"%@",date3);
    [[FHThreadWatcher sharedInstance] startWatchWithWarningHandler:^(NSString *callStack) {
        NSLog(@"%@",callStack);
    }];
    NSLog(@"%@",[@"sss" md5String]);
    NSString *decrypted = [@"sss" stringWithDESEncryptKey:@"1232432"];
    NSLog(@"%@",decrypted);
    NSLog(@"%@",[decrypted stringWithDESDecryptKey:@"1232432"]);
    
    NSString *decrypted2 = [FHDESOperator DESEncryptString:@"sss" withKey:@"1232432"];
    NSLog(@"%@",decrypted2);
    NSLog(@"%@",[FHDESOperator DESDecryptString:decrypted2 withKey:@"1232432"]);
    
    
    self.busyJobTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(onBusyJobTimeout) userInfo:nil repeats:true];
}

- (void)onBusyJobTimeout
{
    [self doBusyJob];
}

- (void)doBusyJob
{
    int logCount = 10000;
    for (int i = 0; i < logCount; i ++) {
        NSLog(@"busy...\n");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
