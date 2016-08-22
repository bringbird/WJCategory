//
//  NSDictionary+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/22.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSDictionary (WJAdd)

/// 将指定的plist文件数据解析成字典
+ (nullable NSDictionary *)dictionaryWithPlistData:(NSData *)plist;

/// 将指定的plist文件的字符串解析成字典
+ (nullable NSDictionary *)dictionaryWithPlistString:(NSString *)plist;

/// 将字典序列化成二进制的plist数据
- (nullable NSData *)plistData;

/// 将字典序列化成 xml 字符串
- (nullable NSString *)plistString;

/// 将字典按 keys 升序排序成数组
- (NSArray *)allKeysSorted;


/// 将字典按 values 升序排序成数组
- (NSArray *)allValuesSortedByKeys;

/// 字典里是否包含自定键值的对象
- (BOOL)containsObjectForKey:(id)key;

/// 将给定的 keys 生成新的字典对象
- (NSDictionary *)entriesForKeys:(NSArray *)keys;

/// 将字典转成 json 字符串，字段之间不会换行
- (nullable NSString *)jsonStringEncoded;

/// 将字典转成 json 字符串，字段之间会换行
- (nullable NSString *)jsonPrettyStringEncoded;

/// 解析XML数据成字典，xmlDataOrString：NSData 或 NSString
+ (nullable NSDictionary *)dictionaryWithXML:(id)xmlDataOrString;


- (BOOL)boolValueForKey:(NSString *)key default:(BOOL)def;
- (char)charValueForKey:(NSString *)key default:(char)def;
- (unsigned char)unsignedCharValueForKey:(NSString *)key default:(unsigned char)def;
- (short)shortValueForKey:(NSString *)key default:(short)def;
- (unsigned short)unsignedShortValueForKey:(NSString *)key default:(unsigned short)def;
- (int)intValueForKey:(NSString *)key default:(int)def;
- (unsigned int)unsignedIntValueForKey:(NSString *)key default:(unsigned int)def;
- (long)longValueForKey:(NSString *)key default:(long)def;
- (unsigned long)unsignedLongValueForKey:(NSString *)key default:(unsigned long)def;
- (long long)longLongValueForKey:(NSString *)key default:(long long)def;
- (unsigned long long)unsignedLongLongValueForKey:(NSString *)key default:(unsigned long long)def;
- (float)floatValueForKey:(NSString *)key default:(float)def;
- (double)doubleValueForKey:(NSString *)key default:(double)def;
- (NSInteger)integerValueForKey:(NSString *)key default:(NSInteger)def;
- (NSUInteger)unsignedIntegerValueForKey:(NSString *)key default:(NSUInteger)def;
- (nullable NSNumber *)numberValueForKey:(NSString *)key default:(nullable NSNumber *)def;
- (nullable NSString *)stringValueForKey:(NSString *)key default:(nullable NSString *)def;
@end

@interface NSMutableDictionary (WJAdd)

/// 将指定的plist文件数据解析成字典
+ (NSMutableDictionary *)dictionaryWithPlistData:(NSData *)plist;

/// 将指定的plist文件的字符串解析成字典
+ (NSMutableDictionary *)dictionaryWithPlistString:(NSString *)plist;


/// 从字典里取出并移除指定对象
- (id)popObjectForKey:(id)aKey;

/// 取出并移除字典里指定的键值对生成新的字典对象
- (NSDictionary *)popEntriesForKeys:(NSArray *)keys;

@end


NS_ASSUME_NONNULL_END