//
//  NSData+FHCat.h
//  FHKit
//
//  Created by 胡翔 on 2018/1/6.
//  Copyright © 2018年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (FHCat)
#pragma mark - Crypto
- (NSData *)md5Data;

- (NSData *)dataWithDESEncryptKey:(NSString *)key;

- (NSData *)dataWithDESDecryptKey:(NSString *)key;

@end
