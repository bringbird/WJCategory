//
//  NSTimer+WJAdd.m
//  WJCategory
//
//  Created by bringbird on 16/8/22.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "NSTimer+WJAdd.h"

@implementation NSTimer (WJAdd)

+ (void)execBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(execBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(execBlock:) userInfo:[block copy] repeats:repeats];
}
@end
