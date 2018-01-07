//
//  NSData+FHCat.m
//  FHKit
//
//  Created by 胡翔 on 2018/1/6.
//  Copyright © 2018年 MADAO. All rights reserved.
//

#import "NSData+FHCat.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (FHCat)

- (NSData *)md5Data {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    NSString *resultStr = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        result[0],result[1],result[2],result[3],
                        result[4],result[5],result[6],result[7],
                        result[8],result[9],result[10],result[11],
                        result[12],result[13],result[14],result[15]];
    return [resultStr dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)dataWithDESEncryptKey:(NSString *)key {
    return [self desOperation:kCCEncrypt withKey:key];
}

- (NSData *)dataWithDESDecryptKey:(NSString *)key {
    return [self desOperation:kCCDecrypt withKey:key];
}

- (NSData *)desOperation:(CCOperation)operation withKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeDES,
                                          NULL,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}
@end
