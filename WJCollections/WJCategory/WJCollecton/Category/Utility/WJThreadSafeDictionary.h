//
//  WJThreadSafeDictionary.h
//  WJCategory
//
//  Created by 韦明杰 on 2016/12/24.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A simple implementation of thread safe mutable dictionary.
 
 @discussion Generally, access performance is lower than NSMutableDictionary,
 but higher than using @synchronized, NSLock, or pthread_mutex_t.
 
 @discussion It's also compatible with the custom methods in `NSDictionary(WJ)`
 and `NSMutableDictionary(WJ)`
 
 @warning Fast enumerate(for...in) and enumerator is not thread safe,
 use enumerate using block instead. When enumerate or sort with block/callback,
 do *NOT* send message to the dictionary inside the block/callback.
 */
@interface WJThreadSafeDictionary : NSMutableDictionary

@end
