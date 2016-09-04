//
//  WJDataTool.h
//  WJCategory
//
//  Created by bringbird on 16/8/29.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJDataTool : NSObject

/// 保存单个数据
+ (void)saveObject:(NSString *)object forKey:(NSString *)key;
/// 保存多个数据
+ (void)saveObjects:(NSArray <NSString *>*)objects forKeys:(NSArray<NSString *> *)keys;

/// 获取数据
+ (NSString *)getObjectForKey:(NSString *)key;
- (NSString *)getObjectForKey:(NSString *)key;

/// 删除单个数据
+ (void)remoObjectForKey:(NSString *)key;
/// 删除多个数据
+ (void)remoObjects:(NSArray <NSString *>*)objects;
@end
