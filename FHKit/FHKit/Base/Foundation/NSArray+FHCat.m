//
//  NSArray+FHCat.m
//  FHKit
//
//  Created by 胡翔 on 2018/2/6.
//  Copyright © 2018年 MADAO. All rights reserved.
//

#import "NSArray+FHCat.h"

@implementation NSArray (FHCat)

- (id)randomObject
{
    if (self.count) {
        return self[arc4random_uniform((uint32_t)self.count)];
    }
    return nil;
}
@end
