//
//  NSString+FHCat.h
//  FHKit
//
//  Created by 胡翔 on 2018/1/6.
//  Copyright © 2018年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FHCat)

- (NSString *)md5String;

- (NSString *)stringWithDESEncryptKey:(NSString *)key;

- (NSString *)stringWithDESDecryptKey:(NSString *)key;
@end
