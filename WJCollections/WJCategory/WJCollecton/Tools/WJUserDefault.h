//
//  WJUserDefault.h
//  WJCategory
//
//  Created by 韦明杰 on 2016/12/19.
//  Copyright © 2016年 dacong. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

/** Provide some common method for `NSUserDefaults`.
 */
@interface WJUserDefault : NSObject

/**
 Sets the value of the specified key.
 
 @param object The object to be stored. If nil, it calls `removeObjectForKey:`.
 @param key    The key with which to associate the value.
 If nil, this method has no effect.
 */
+ (void)setObject:(nullable id)object forKey:(nullable NSString *)key;

/**
 Sets the values of the specified keys.
 
 @param objects The objects to be stored. If one of the objects is nil, it calls `removeObjectForKey:`.
 @param keys    The keys with which to associate the values.
 
 @note      If one of the keys is nil, will automatically be ignored.
 @warning   objects.cont must equal to keys.cont!!!
 */
+ (void)setObjects:(nonnull NSArray<id>*)objects forKeys:(nonnull NSArray<NSString*> *)keys;

/**
 Returns the value associated with a given key.
 
 @param key A string identifying the value. If nil, just return nil.
 @return The value associated with key, or nil if no value is associated with key.
 */
+ (nullable id)objectForKey:(nullable NSString *)key;

/**
 Returns the value associated with a given key.
 
 @param key A string identifying the value. If nil, just return nil.
 @return The value associated with key, or nil if no value is associated with key.
 */
- (nullable id)objectForKey:(nullable NSString *)key;

/**
 Removes the value of the specified key.
 
 @param key The key identifying the value to be removed.
 If nil, this method has no effect.
 */
+ (void)removeObjectForKey:(nullable NSString *)key;


/**
 Removes the value of the specified key.
 
 @param keys The keys identifying the values to be removed.
 If one of the keys is nil, will automatically be ignored.
 */
+ (void)removeObjectsForKeys:(nonnull NSArray <NSString*> *)keys;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new  UNAVAILABLE_ATTRIBUTE;
@end
NS_ASSUME_NONNULL_END
