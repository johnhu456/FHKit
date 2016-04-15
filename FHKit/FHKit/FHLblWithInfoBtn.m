//
//  FHLblWithInfoBtn.m
//  Shire
//
//  Created by MADAO on 15/11/21.
//  Copyright © 2015年 LLJZ. All rights reserved.
//

#import "FHLblWithInfoBtn.h"

@interface FHLblWithInfoBtn ()

typedef void(^InfoBtnOnClicked)();
/**按钮Block*/
@property (nonatomic, weak) InfoBtnOnClicked infoOnClikced;
@end

@implementation FHLblWithInfoBtn
- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                        image:(UIImage *)image
                      handler:(void (^)())handler
{
    if (self = [super initWithFrame:frame]) {
        /**标签*/
        self.lblTitle = [[UILabel alloc] init];
        self.lblTitle.frame = (CGRect){CGPointZero, {self.frame.size.width -20  , self.frame.size.height}};
        self.lblTitle.text = title;
        self.lblTitle.font = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
        self.lblTitle.textAlignment = NSTextAlignmentCenter;
        self.lblTitle.textColor = [UIColor whiteColor];
        [self addSubview:self.lblTitle];
        
        /**图标*/
        UIImageView *infoView  = [[UIImageView alloc] init];
        infoView.backgroundColor = [UIColor clearColor];
        infoView.image = image;
        CGPoint btnOrigin = CGPointMake(self.frame.size.width - 15, 2.5);
        infoView.frame = (CGRect){btnOrigin,{15, 15}};
        [self addSubview:infoView];
        
        /**隐藏Button*/
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [button addTarget:self action:@selector(infoButtonOnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        self.infoOnClikced = handler;
        
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

#pragma mark - Action
- (void)infoButtonOnClicked
{
    self.infoOnClikced();
}
@end
