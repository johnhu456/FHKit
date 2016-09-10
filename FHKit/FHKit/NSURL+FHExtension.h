//
//  NSURL+FHExtension.h
//  FHKit
//
//  Created by MADAO on 16/9/10.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (FHExtension)
/**
 *  Create URL from a string which may has special characters
 *
 *  @param string A string representing an URL
 *
 *  @return An URL converted from a string which used UTF8 to encode
 */
+ (instancetype)URLWithUTF8String:(NSString *)string;

@end
