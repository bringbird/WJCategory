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

/// md2 加密
- (NSString *)md2String;

/// md2 加密
- (NSData *)md2Data;

/// md4 加密
- (NSString *)md4String;

/// md4 加密
- (NSData *)md4Data;

/// md5 加密
- (NSString *)md5String;

/// md5 加密
- (NSData *)md5Data;

/// sha1 加密
- (NSString *)sha1String;

/// sha1 加密
- (NSData *)sha1Data;

/// sha224 加密
- (NSString *)sha224String;

/// sha224 加密
- (NSData *)sha224Data;

/// sha256 加密
- (NSString *)sha256String;

/// sha256 加密
- (NSData *)sha256Data;

/// sha384 加密
- (NSString *)sha384String;

/// sha384 加密
- (NSData *)sha384Data;

/// sha512 加密
- (NSString *)sha512String;

/// sha512 加密
- (NSData *)sha512Data;

/// base64 编码字符串.
- (nullable NSString *)base64EncodedString;

/// nase64 编码数据
+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;
@end
NS_ASSUME_NONNULL_END