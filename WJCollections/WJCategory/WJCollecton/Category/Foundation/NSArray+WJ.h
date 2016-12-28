//
//  NSArray+WJ.h
//  WJCategory
//
//  Created by bringbird on 16/8/22.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSArray (WJ)

/// 是否为空数组
- (BOOL)isEmpetyArray;

/// 将指定的plist文件数据转成数组，plist：必须为数组类型
+ (nullable NSArray *)arrayWithPlistData:(NSData *)plist;

/// 将指定的plist文件的字符串转成数组，plist：必须为数组类型
+ (nullable NSArray *)arrayWithPlistString:(NSString *)plist;

/// 将数组序列化成二进制的plist数据
- (nullable NSData *)plistData;

/// 将数组序列化成 xml 字符串
- (nullable NSString *)plistString;

/// 随机取出一个对象
- (nullable id)randomObject;

/// 取出指定索引的对象
- (nullable id)objectOrNilAtIndex:(NSUInteger)index;

/// 将数组转成 json 字符串，字段之间不会换行
- (nullable NSString *)jsonStringEncoded;

/// 将数组转成 json 字符串，字段之间会换行
- (nullable NSString *)jsonPrettyStringEncoded;

/// 将数组转成字符串，字段之间不会换行
- (nullable NSString *)stringEncoded;

/// 将数组转成字符串，字段之间会换行
- (nullable NSString *)stringPrettyEncoded;

/// 数组交集
- (nullable NSArray *)intersectionWithArray:(NSArray *)otherArray;

/// 数组差集
- (nullable NSArray *)differenSetWithArray:(NSArray *)otherArray;

@end

@interface NSMutableArray (WJ)

/// 将指定的plist文件数据转成数组，plist：必须为数组类型
+ (nullable NSMutableArray *)arrayWithPlistData:(NSData *)plist;

/// 将指定的plist文件的字符串转成数组，plist：必须为数组类型
+ (nullable NSMutableArray *)arrayWithPlistString:(NSString *)plist;

/// 移除第一个对象
- (void)removeFirstObject;

/// 移除最后一个对象
- (void)removeLastObject;

/// 取出并移除数组里的第一个对象
- (nullable id)popFirstObject;

/// 取出并移除数组里的最后一个对象
- (nullable id)popLastObject;

/// 将一个对象插入数组的末尾
- (void)appendObject:(id)anObject;

/// 将一个对象插入数组的最前面
- (void)prependObject:(id)anObject;

/// 将一个数组插入数组的末尾
- (void)appendObjects:(NSArray *)objects;

/// 将一个数组插入数组的最前面
- (void)prependObjects:(NSArray *)objects;

/// 插入一个数组到指定的位置
- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;

/// 数组翻转 @[ @1, @2, @3 ] -> @[ @3, @2, @1 ]
- (void)reverse;

/// 将数组随机排序
- (void)shuffle;
@end
NS_ASSUME_NONNULL_END
