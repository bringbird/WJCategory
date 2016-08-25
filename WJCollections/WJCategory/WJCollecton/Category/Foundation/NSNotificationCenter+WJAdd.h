//
//  NSNotificationCenter+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/22.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSNotificationCenter (WJAdd)

/// 在主线程里发送通知，如果当前线程为主线程，将异步发送，否则将异步发送。
- (void)postNotificationOnMainThread:(NSNotification *)notification;

/// 在主线程里发送通知，如果当前线程为主线程，将异步发送，否则将异步发送。
/// waitUntilDone：是否等待主线程处理完其他逻辑之后才发送通知
- (void)postNotificationOnMainThread:(NSNotification *)notification waitUntilDone:(BOOL)wait;

/// 在主线程里发送通知，如果当前线程为主线程，将同步发送，否则将异步发送。
/// object：发送通知的对象
- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(nullable id)object;

/// 在主线程里发送通知，如果当前线程为主线程，将异步发送，否则将异步发送。
/// name：通知名
/// object：发送通知的对象
/// userInfo：通知信息
- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;

/// 在主线程里发送通知，如果当前线程为主线程，将异步发送，否则将异步发送。
/// name：
/// object：发送通知的对象
/// userInfo：通知信息
/// waitUntilDone：是否等待主线程处理完其他逻辑之后才发送通知
- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo waitUntilDone:(BOOL)wait;
@end
NS_ASSUME_NONNULL_END