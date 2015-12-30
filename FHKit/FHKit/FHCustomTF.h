//
//  FHCustomTF.h
//  FHColorTool
//
//  Created by MADAO on 15/12/29.
//  Copyright © 2015年 MADAO. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

/**输入框风格*/
typedef enum : NSUInteger {
    FHCustomTFTypeDefault,
    /**密码风格*/
    FHCustomTFTypePassword,
    /**仅允许数字*/
    FHCustomTFTypeNumOnly
} FHCustomTFType;

@protocol FHCustomTFDelegate <NSObject>

- (void)customTFRightButtonOnClick:(UIButton *)button;

@end

@interface FHCustomTF : UITextField
/**
 *  初始化方法
 *
 *  @param tip         LeftView的提示标签内容
 *  @param placeholder TF的Placeholder
 *  @param title       RightView的按钮文字（nil则为不需要按钮）
 *  @param type        TF及键盘风格
 *
 *  @return self
 */
- (instancetype)initWithTip:(nullable NSString *)tip
                placeholder:(nullable NSString *)placeholder
                buttonTitle:(nullable NSString *)title
               textViewType:(FHCustomTFType)type;
/**LeftView提示标签*/
@property (nonatomic, strong)  UILabel * _Nullable lblLeftTip;
/**RightView按钮*/
@property (nonatomic, strong)  UIButton * _Nullable btnRightCustom;
/**代理*/
@property (nonatomic, weak) id<FHCustomTFDelegate>fhCusotmTFDelegate;
NS_ASSUME_NONNULL_END
@end
