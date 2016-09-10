//
//  UIFont+FHExtension.h
//  FHKit
//
//  Created by MADAO on 16/9/10.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (FHExtension)

/**
 *  Search and get the font, if the font is not existed in system. It will auto downloads the font if it's in Apple's support list:http://support.apple.com/kb/HT5484 or https://support.apple.com/zh-cn/HT202771
 *
 *  @param fontName    Name of the font
 *  @param fontSize    Size of the font
 *  @param searchBlock A block returns the information of searching/downloading progress and the font you want.
 */
+ (void)searchOrDownloadFontInName:(NSString *)fontName size:(CGFloat)fontSize taskBlock:(void(^)(UIFont *font, CGFloat progress))searchBlock;

@end
