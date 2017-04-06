//
//  UIGestureRecognizer+WJ.m
//  WJCategory
//
//  Created by bringbird on 16/8/24.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "UIGestureRecognizer+WJ.h"
#import <objc/runtime.h>

static const int block_key;
@interface _UIGestureRecognizerBlockTarget : NSObject
@property (nonatomic, copy) void (^block)(id sender);
- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;
@end
@implementation _UIGestureRecognizerBlockTarget
- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}
- (void)invoke:(id)sender {
    if (_block) _block(sender);
}
@end


@implementation UIGestureRecognizer (WJ)
- (instancetype)initWithActionBlock:(void (^)(id sender))block {
    self = [self init];
    [self addActionBlock:block];
    return self;
}
- (void)addActionBlock:(void (^)(id sender))block {
    _UIGestureRecognizerBlockTarget *target = [[_UIGestureRecognizerBlockTarget alloc] initWithBlock:block];
    [self addTarget:target action:@selector(invoke:)];
    NSMutableArray *targets = [self _allUIGestureRecognizerBlockTargets];
    [targets addObject:target];
}
- (void)removeAllActionBlocks{
    NSMutableArray *targets = [self _allUIGestureRecognizerBlockTargets];
    [targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        [self removeTarget:target action:@selector(invoke:)];
    }];
    [targets removeAllObjects];
}

- (NSMutableArray *)_allUIGestureRecognizerBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}
@end
