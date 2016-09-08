//
//  NSDate+FHExtension.h
//  FHKit
//
//  Created by MADAO on 16/9/8.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FHExtension)
/**
 *  return A string value representing the date;
 *
 *  @param format A string representing the date format
 *                e.g.@"yyyy-MM-dd HH:mm:ss"
 *
 *  @return The result string representing formatted date.
 */
- (NSString *)stringWithFormat:(NSString *)format;
/**
 *  return Date value converted from the stirng
 *
 *  @param string String representing the date
 *  @param format  A string representing the date format
 *                e.g.@"yyyy-MM-dd HH:mm:ss"
 *
 *  @return The result date converted from the stirng
 */
+ (NSDate *)dateWithString:(NSString *)string andFormat:(NSString *)format;

@end
