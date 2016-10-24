//
//  WJTimer.m
//  WJCategory
//
//  Created by bringbird on 16/10/23.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJTimer.h"

@interface WJTimer () {
    NSTimer *_timer;
    BOOL    _repeats;
}

- (void)onTimer: (NSTimer *)timer;

@end

@implementation WJTimer

- (void)startTimer:(NSTimeInterval)seconds delegate:(id<WJTimerDelegate>)delegate repeats: (BOOL)repeats {
    _delegate = delegate;
    _repeats = repeats;
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(onTimer:) userInfo:nil repeats:repeats];
}

- (void)onTimer:(NSTimer *)timer {
    if (!_repeats) {
        _timer = nil;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(onTimer:)]) {
        [_delegate onTimerFire:self];
    }
}

- (void)stopTimer {
    [_timer invalidate];
    _timer = nil;
    _delegate = nil;
}

- (void)dealloc {
    [self stopTimer];
}
@end
