//
//  EncryptionTool.h
//  Small_Knowledge
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptionTool : NSObject
/**
 MD5加密 小写 32位
 
 @param str 要加密的字符串
 @return 返回加密后的字符串
 */
+ (NSString *)MD5ForLower32Bite:(NSString *)str;


/**
 MD5加密 大写 32位
 
 @param str 要加密的字符串
 @return 返回加密后的字符串
 */
+ (NSString *)MD5ForUpper32Bite:(NSString *)str;

/**
 MD5加密 小写 16位
 
 @param str 要加密的字符串
 @return 返回加密后的字符串
 */
+ (NSString *)MD5ForLower16Bite:(NSString *)str;

/**
 MD5加密 大写 16位
 
 @param str 要加密的字符串
 @return 返回加密后的字符串
 */
+ (NSString *)MD5ForUpper16Bite:(NSString *)str;


/**
 base64编码
 iOS7.0之后提供了base64的编码和解码支持
 @param str 要加密的字符串
 @return 返回加密后的字符串
 */
+ (NSString *)base64EncodeString:(NSString *)str;


/**
 base64解码

 @param str 要解码的字符串
 @return 返回解码之后的字符串
 */
+ (NSString *)base64DecodeString:(NSString *)str;
@end
