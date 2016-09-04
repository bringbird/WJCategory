//
//  WJDataTool.m
//  WJCategory
//
//  Created by bringbird on 16/8/29.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJDataTool.h"

@implementation WJDataTool

+ (void)saveObject:(NSString *)object forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:object forKey:key];
    [userDefaults synchronize];
}

+ (void)saveObjects:(NSArray<NSString *> *)objects forKeys:(NSArray<NSString *> *)keys {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    for (NSUInteger i = 0; i<objects.count; i++) {
        [userDefaults setObject:objects[i] forKey:keys[i]];
        
    }
    [userDefaults synchronize];
}

+ (NSString *)getObjectForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

- (NSString *)getObjectForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+ (void)remoObjectForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
}

+ (void)remoObjects:(NSArray <NSString *>*)objects {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    for (NSString *key in objects) {
        [userDefaults removeObjectForKey:key];
    }
}

@end
