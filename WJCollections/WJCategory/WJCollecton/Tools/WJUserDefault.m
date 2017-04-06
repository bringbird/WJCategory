//
//  WJUserDefault.m
//  WJCategory
//
//  Created by 韦明杰 on 2016/12/19.
//  Copyright © 2016年 dacong. All rights reserved.
//

#import "WJUserDefault.h"

@implementation WJUserDefault

+ (void)setObject:(id)object forKey:(NSString *)key {
    if (!key.length) return;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    object ? [userDefaults setObject:object forKey:key]
               : [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+ (void)setObjects:(NSArray<id>*)objects forKeys:(NSArray<NSString*>*)keys {
    NSAssert(objects.count == keys.count, @"objects.count != keys.count.");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    for (NSUInteger i = 0; i < keys.count; i++) {
        if (!keys[i].length) continue;
        objects[i] ? [userDefaults setObject:objects[i] forKey:keys[i]]
                   : [userDefaults removeObjectForKey:keys[i]];
    }
    [userDefaults synchronize];
}

+ (id)objectForKey:(NSString *)key {
    if (!key.length) return nil;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

- (id)objectForKey:(NSString *)key {
    if (!key.length) return nil;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+ (void)removeObjectForKey:(NSString *)key {
    if (!key.length) return;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+ (void)removeObjectsForKeys:(NSArray <NSString *>*)keys {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    for (NSString *key in keys) {
        if (!key.length) continue;
        [userDefaults removeObjectForKey:key];
    }
    [userDefaults synchronize];
}

@end
