//
//  FHLblWithInfoBtn.h
//  Shire
//
//  Created by MADAO on 15/11/21.
//  Copyright © 2015年 LLJZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHLblWithInfoBtn : UIView
/**标签Label*/
@property (nonatomic, strong) UILabel *lblTitle;
/**
 *  带小图标按钮的提示标签
 *  @param frame   建议高度为20
 *  @param title   标题
 *  @param image   图片（标准大小为20x20）
 *  @param handler 触发动作Block
 *
 *  @return 
 */
- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                        image:(UIImage *)image
                      handler:(void(^)())handler;
@end
