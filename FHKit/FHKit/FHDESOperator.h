//
//  FHDESOperator.h
//  FHKit
//
//  Created by MADAO on 16/8/29.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHDESOperator : NSObject
/**NSData DES加密*/
+ (NSData *)DESEncryptedData:(NSData *)data withKey:(NSString *)key;

/**NSData DES解密*/
+ (NSData *)DESDecryptedData:(NSData *)data withKey:(NSString *)key;

/**NSString DES加密*/
+ (NSString*)DESEncryptString:(NSString*)string withKey:(NSString *)key;

/**NSString DES解密*/
+ (NSString *)DESDecryptString:(NSString *)string withKey:(NSString *)key;

@end
