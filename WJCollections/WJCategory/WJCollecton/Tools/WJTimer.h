//
//  WJTimer.h
//  WJCategory
//
//  Created by bringbird on 16/10/23.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WJTimer;

@protocol WJTimerDelegate <NSObject>

@required

/// 计时器重复执行代理方法  timer:WJTimer
- (void)onTimerFire:(WJTimer *)timer;

@end

@interface WJTimer : NSObject

@property (nonatomic,weak) id<WJTimerDelegate> delegate;

/// 开启计时器 seconds:重复间隔  delegate:计时器代理  repeat:是否重复执行代理方法
- (void)startTimer:(NSTimeInterval)seconds delegate:(id<WJTimerDelegate>)delegate repeats:(BOOL)repeats;

/// 停止并销毁计时器
- (void)stopTimer;

@end
