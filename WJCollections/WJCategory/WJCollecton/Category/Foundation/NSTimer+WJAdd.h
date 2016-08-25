//
//  NSTimer+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/22.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WJAdd)

/// NSDefaultRunLoopMode 模式下的定时器，1秒后自动触发，block：会造成强引用，repeats：是否重复调用block里的函数。
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

/// block：会造成强引用，repeats：是否重复调用block里的函数，需要调用 '[[NSRunLoop currentRunLoop] addTimer:timer forMode:mode]' 方法添加到指定的 run loop，并且调用 ‘-fire’ 方法才会触发。
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end
