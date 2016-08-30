//
//  FHDESOperator.m
//  FHKit
//
//  Created by MADAO on 16/8/29.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "FHDESOperator.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation FHDESOperator

#pragma mark - NSData
// DES加密
+ (NSData *)DESEncryptedData:(NSData *)data withKey:(NSString *)key
{
    return [self DESOperation:kCCEncrypt withData:data key:key];
}

// DES解密
+ (NSData *)DESDecryptedData:(NSData *)data withKey:(NSString *)key
{
    return [self DESOperation:kCCDecrypt withData:data key:key];
}


// DES 加密/解密
+ (NSData *)DESOperation:(CCOperation)operation withData:(NSData *)data key:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeDES,
                                          NULL,
                                          [data bytes],
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

#pragma mark - NSString

// NSString DES加密
+ (NSString *)DESEncryptString:(NSString *)string withKey:(NSString *)key
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *encryptedData = [self DESEncryptedData:data withKey:key];
    
    NSString *base64EncryptedString = [encryptedData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return base64EncryptedString;
}


// NSString DES解密
+ (NSString *)DESDecryptString:(NSString *)string withKey:(NSString *)key
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *decryptedData = [self DESEncryptedData:data withKey:key];
    
    NSString *decryptedString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

@end
