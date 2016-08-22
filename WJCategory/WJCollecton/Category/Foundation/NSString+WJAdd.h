//
//  NSString+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
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

/// sha1 加密
- (nullable NSString *)sha1String;

/// sha224 加密
- (nullable NSString *)sha224String;

/// sha256 加密
- (nullable NSString *)sha256String;

/// sha384 加密
- (nullable NSString *)sha384String;

/// sha512 加密
- (nullable NSString *)sha512String;

/// base64 编码.
- (nullable NSString *)base64EncodedString;

/// base64 编码
+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

/// UUID 字符串
+ (NSString *)stringWithUUID;

/// 判断是否是手机号码
- (BOOL)isMobileNumber;

/// 判断字符串是否为空(nil, @"", @"  ", @"\n")
- (BOOL)isNotBlank; 

/// 正则匹配，regex：正则表达式，options：匹配方式
- (BOOL)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

/// string 转 URL
- (NSURL *)url;

/// 时间转时间戳
- (NSString *)date2Timestamp;

/// 字符串转日期，format：日期格式
- (NSDate *)string2dateWithFromat:(NSString *)format;

/// 当前时间戳
+ (NSString *)currentTimeIntervalSince1970;

/// 计算字符串的尺寸，font：字体大小，lineBreakMode：字体类型
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/// 计算字符串的宽，font：字体
- (CGFloat)widthForFont:(UIFont *)font;

/// 计算字符串的高，font：字符串的字体， width：指定的宽
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;

@end
NS_ASSUME_NONNULL_END

