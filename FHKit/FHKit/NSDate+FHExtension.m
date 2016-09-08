//
//  NSDate+FHExtension.m
//  FHKit
//
//  Created by MADAO on 16/9/8.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "NSDate+FHExtension.h"

@implementation NSDate (FHExtension)

- (NSString *)stringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)dateWithString:(NSString *)string andFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return [dateFormatter dateFromString:string];
}
@end
