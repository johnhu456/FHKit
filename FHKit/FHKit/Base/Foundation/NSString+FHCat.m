//
//  NSString+FHCat.m
//  FHKit
//
//  Created by 胡翔 on 2018/1/6.
//  Copyright © 2018年 MADAO. All rights reserved.
//

#import "NSString+FHCat.h"
#import "NSData+FHCat.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation NSString (FHCat)

- (NSString *)md5String {
    return [[NSString alloc] initWithData:[[self dataUsingEncoding:NSUTF8StringEncoding] md5Data] encoding: NSUTF8StringEncoding];
}

- (NSString *)stringWithDESEncryptKey:(NSString *)key {
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *encryptedData = [data dataWithDESEncryptKey:key];
    NSString *base64EncryptedString = [encryptedData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64EncryptedString;
}

- (NSString *)stringWithDESDecryptKey:(NSString *)key {
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64DecodeData = [[NSData alloc] initWithBase64EncodedData:plainData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *decryptedData = [base64DecodeData dataWithDESDecryptKey:key];
    NSString *decryptedString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    return decryptedString;
}

- (NSString *)stringWithURLEncoded
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)stringWithURLDecoded
{
    return [self stringByRemovingPercentEncoding];
}

@end

