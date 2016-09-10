//
//  NSURL+FHExtension.m
//  FHKit
//
//  Created by MADAO on 16/9/10.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "NSURL+FHExtension.h"

@implementation NSURL (FHExtension)

+ (instancetype)URLWithUTF8String:(NSString *)string;
{
    //  Way1:
    //    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
    //                                                                                                    (CFStringRef)string,
    //                                                                                                    (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
    //                                                                                                    NULL,
    //                                                                                                    kCFStringEncodingUTF8));
    //
    //    return [NSURL URLWithString:encodedString];
    
    //  Way2:
    return [NSURL URLWithString:[string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}
@end
