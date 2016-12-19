//
//  NSString+WJAdd.h
//
//
//  Created by bringbird on https://github.com/bringbird 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSString (WJAdd)

/// md2 加密
- (nullable NSString *)md2String;

/// md4 加密
- (nullable NSString *)md4String;

/// md5 加密
- (nullable NSString *)md5String;

/// MD5 字符串加密，key：秘钥
- (nullable NSString *)md5StringWithKey:(NSString *)key;

/// sha1 加密
- (nullable NSString *)sha1String;

/// SHA1 字符串加密，key：秘钥
- (nullable NSString *)sha1StringWithKey:(NSString *)key;

/// sha224 加密
- (nullable NSString *)sha224String;

/// SHA224 字符串加密，key：秘钥
- (nullable NSString *)sha224StringWithKey:(NSString *)key;

/// sha256 加密
- (nullable NSString *)sha256String;

/// SHA256 字符串加密，key：秘钥
- (nullable NSString *)sha256StringWithKey:(NSString *)key;

/// sha384 加密
- (nullable NSString *)sha384String;

/// SHA384 字符串加密，key：秘钥
- (nullable NSString *)sha384StringWithKey:(NSString *)key;

/// sha512 加密
- (nullable NSString *)sha512String;

/// SHA512 字符串加密，key：秘钥
- (nullable NSString *)sha512StringWithKey:(NSString *)key;

/// crc32 加密
- (NSString *)crc32String;

/// base64 编码.
- (nullable NSString *)base64EncodedString;

/// base64 编码
+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

/// 将字符串解析成 NSDictionary 或 NSArray
- (id)jsonValueDecoded;

/// URL utf-8 编码
- (NSString *)stringByURLEncode;

/// URL utf-8 解码
- (NSString *)stringByURLDecode;

/// 避开常见的HTML实体
/// 例："a<b" will -> "a&lt;b"
- (NSString *)stringByEscapingHTML;

/// UUID 字符串
+ (NSString *)stringWithUUID;

/// 是否包含指定的字符串, 忽略大小写
- (BOOL)containsString:(NSString *)string;

/// 字符串是否相同，忽略大小写
- (BOOL)equalsString:(NSString *)str;

/// 是否是手机号码
- (BOOL)isPhoneNumber;

/// 字符串是否为空(nil, @"", @"　", @"\n")
- (BOOL)isNotBlank;

/// 正则匹配，regex：正则表达式，options：匹配方式
- (BOOL)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

/// 获取指定字符串的字节长度
- (NSInteger)byteLength;

/// 将 ‘UTF32Char’ 字符数组转成 ’NSString‘ ，length：数组长度
+ (NSString *)stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length;

/// ‘UTF32Char’ 转 ’NSString‘
+ (NSString *)stringWithUTF32Char:(UTF32Char)char32;

/// 删除字符串头部或尾部的空白和换行符
- (NSString *)stringByTrim;

/// 删除字符串中所有空白
- (NSString *)removeWhiteSpace;

/// string 转 URL
- (NSURL *)url;

/// 时间转时间戳
- (NSString *)date2Timestamp;

/// 字符串拼接
- (NSString *)appending:(NSString *)appen;

/// 字符串转日期，format：日期格式
- (NSDate *)string2dateWithFromat:(NSString *)format;

/// 'NSString' 转 'NSNumber'
- (NSNumber *)numberValue;

/// 将 NSString UTF-8 编码 成 NSData
- (NSData *)dataValue;

/// 当前时间戳
+ (NSString *)currentTimeIntervalSince1970;

/// 计算字符串的尺寸，font：字体大小，size：限定大小，lineBreakMode：字体类型
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/// 计算字符串的宽，font：字体
- (CGFloat)widthForFont:(UIFont *)font;

/// 计算字符串的高，font：字符串的字体， width：指定的宽
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;

- (char )charValue;
- (long )longValue;
- (short)shortValue;
- (unsigned int)unsignedIntValue;
- (unsigned long)unsignedLongValue;
- (unsigned char)unsignedCharValue;
- (unsigned short)unsignedShortValue;
- (unsigned long long)unsignedLongLongValue;
@end
@interface NSNumber (WJAdd)
/// NSNumber 转 NSString 可以是 @"12"、@"12.345"、@" -0xFF"、@" .23e99 " 形式。
+ (nullable NSNumber *)numberWithString:(NSString *)string;
@end
NS_ASSUME_NONNULL_END

