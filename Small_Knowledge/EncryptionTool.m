//
//  EncryptionTool.m
//  Small_Knowledge
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "EncryptionTool.h"
#import <CommonCrypto/CommonCrypto.h>

/*
 CommonCrypto:为苹果提供的系统加密接口,支持ios和mac开发
 不仅限于AES加密,提供的接口还支持其他DES,3DES,RC4,BLOWFISH等算法
 //CC_MD5_DIGEST_LENGTH 16
 */
@implementation EncryptionTool


//MD5小写32位加密:x
+(NSString *)MD5ForLower32Bite:(NSString *)str
{
    const char *input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH ; i++) {
        [digest appendFormat:@"%02x",result[i]];
    }
    return digest;
}

//MD5大写32位加密:X
+(NSString *)MD5ForUpper32Bite:(NSString *)str
{
    const char *input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH ; i++) {
        [digest appendFormat:@"%02X",result[i]];
    }
    return digest;
}

+ (NSString *)MD5ForLower16Bite:(NSString *)str
{
    NSString *md5Str = [[self class] MD5ForLower32Bite:str];
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

+ (NSString *)MD5ForUpper16Bite:(NSString *)str
{
    NSString *md5Str = [[self class] MD5ForUpper32Bite:str];
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

//base64编码
+(NSString *)base64EncodeString:(NSString *)str
{
    //先把字符串转换成二进制数据
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //对二进制数据进行base64编码,返回编码后的字符串
    return [data base64EncodedStringWithOptions:0];
}

//base64解码
+ (NSString *)base64DecodeString:(NSString *)str
{
    //将解码后的字符串转换成二进制数据
    NSData *data = [[NSData alloc]initWithBase64EncodedString:str options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}



@end
