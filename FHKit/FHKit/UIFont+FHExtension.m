//
//  UIFont+FHExtension.m
//  FHKit
//
//  Created by MADAO on 16/9/10.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "UIFont+FHExtension.h"
#import <CoreText/CoreText.h>

@implementation UIFont (FHExtension)

+ (void)searchOrDownloadFontInName:(NSString *)fontName size:(CGFloat)fontSize taskBlock:(void(^)(UIFont *font, CGFloat progress))searchBlock
{
    //Get A CoreFundation type Font array
    NSMutableDictionary *fontAttrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];
    CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)fontAttrs);
    NSMutableArray *descArray = [NSMutableArray new];
    [descArray addObject:(__bridge id)desc];
    CFRelease(desc);
    
    __block BOOL _findFlag = NO;
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler((__bridge CFArrayRef)descArray, NULL, ^bool(CTFontDescriptorMatchingState state, CFDictionaryRef  _Nonnull progressParameter) {
        //Get progress
        NSDictionary *progressDic = (__bridge NSDictionary *)progressParameter;
        
        if (state == kCTFontDescriptorMatchingDidMatch ) {
            _findFlag = YES;
        }
        if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
            _findFlag = YES;
        }
        if (_findFlag == YES) {
            searchBlock([UIFont fontWithName:fontName size:fontSize],1);
        }
        else{
            searchBlock(nil,[progressDic[@"progess"] doubleValue]);
        }
        return YES;
    });
}

@end
