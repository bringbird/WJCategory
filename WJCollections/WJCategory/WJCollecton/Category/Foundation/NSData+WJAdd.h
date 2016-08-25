//
//  NSData+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSData (WJAdd)

#pragma mark - 字符串加密

/// md2 字符串加密
- (NSString *)md2String;

/// md4 字符串加密
- (NSString *)md4String;

/// md5 字符串加密
- (NSString *)md5String;

/// md5 字符串加密，key：秘钥
- (NSString *)md5StringWithKey:(NSString *)key;

/// SHA1 字符串加密
- (NSString *)sha1String;

/// SHA1 字符串加密，key：秘钥
- (NSString *)sha1StringWithKey:(NSString *)key;

/// SHA224 字符串加密
- (NSString *)sha224String;

/// SHA224 字符串加密，key：秘钥
- (NSString *)sha224StringWithKey:(NSString *)key;

/// SHA256 字符串加密
- (NSString *)sha256String;

/// SHA256 字符串加密，key：秘钥
- (NSString *)sha256StringWithKey:(NSString *)key;

/// SHA384 字符串加密
- (NSString *)sha384String;

/// SHA384 字符串加密，key：秘钥
- (NSString *)sha384StringWithKey:(NSString *)key;

/// SHA512 字符串加密
- (NSString *)sha512String;

/// SHA512 字符串加密，key：秘钥
- (NSString *)sha512StringWithKey:(NSString *)key;

/// crc32 字符串加密
- (NSString *)crc32String; 

/// md2 数据加密
- (NSData *)md2Data;

/// md4 数据加密
- (NSData *)md4Data;

/// md5 数据加密
- (NSData *)md5Data;

/// md5 数据加密，key：秘钥
- (NSData *)md5DataWithKey:(NSData *)key;

/// SHA1 数据加密
- (NSData *)sha1Data;

/// SHA1 数据加密，key：秘钥
- (NSData *)sha1DataWithKey:(NSData *)key;

/// SHA224 数据加密
- (NSData *)sha224Data;

/// SHA224 数据加密，key：秘钥
- (NSData *)sha224DataWithKey:(NSData *)key;

/// SHA256 数据加密
- (NSData *)sha256Data;

/// SHA256 数据加密，key：秘钥
- (NSData *)sha256DataWithKey:(NSData *)key;

/// SHA384 数据加密
- (NSData *)sha384Data;

/// SHA384 数据加密，key：秘钥
- (NSData *)sha384DataWithKey:(NSData *)key;

/// SHA512 数据加密
- (NSData *)sha512Data;

/// SHA512 数据加密，key：秘钥
- (NSData *)sha512DataWithKey:(NSData *)key;

/// crc32 加密
- (uint32_t)crc32;

/// aes256 数据加密，key：秘钥，iv：初始化的向量，长度为16(128位)可为空
- (nullable NSData *)aes256EncryptWithKey:(NSData *)key iv:(nullable NSData *)iv;

/// aes256 数据解码，key：秘钥，iv：初始化的向量，长度为16(128位)可为空
- (nullable NSData *)aes256DecryptWithkey:(NSData *)key iv:(nullable NSData *)iv;

/// utf8 解码
- (NSString *)utf8String;

/// 哈希字符串转 NSData
+ (NSData *)dataWithHexString:(NSString *)hexStr;

/// NSData 转大写字母的哈希字符串
- (NSString *)hexString;

/// 将json数据解析成 NSDiction 或 NSArray
- (id)jsonValueDecoded;

/// base64 编码字符串.
- (nullable NSString *)base64EncodedString;

/// base64 编码数据
+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

/// gzip 解压缩
- (nullable NSData *)gzipInflate;

/// gzip 压缩
- (nullable NSData *)gzipDeflate;

/// zlib 解压缩
- (nullable NSData *)zlibInflate;

/// zlib 压缩
- (nullable NSData *)zlibDeflate;

@end
NS_ASSUME_NONNULL_END