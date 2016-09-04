//
//  WJMoveView.m
//  WJCategory
//
//  Created by bringbird on 16/9/4.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJMoveView.h"

@interface WJMoveView ()
@property (nonatomic, strong) UIView *rectangleView;
@property (nonatomic, assign) CGPoint startPointMoveView;
@end

@implementation WJMoveView

-(void)awakeFromNib {
    [super awakeFromNib];
    [self addPanGestureRecognizer];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addPanGestureRecognizer];
    }
    return self;
}

- (void)addPanGestureRecognizer {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveRectangleView:)];
    [self addGestureRecognizer:panGesture];
}

- (void)moveRectangleView:(UIPanGestureRecognizer *)panGesture {
    CGFloat minX = CGRectGetMinX(self.superview.frame);
    CGFloat maxX = CGRectGetMaxX(self.superview.frame) - CGRectGetWidth(self.frame);
    CGFloat minY = CGRectGetMinY(self.superview.frame) + 64;
    CGFloat maxY = CGRectGetMaxY(self.superview.frame) - CGRectGetHeight(self.frame);
    if(panGesture.state == UIGestureRecognizerStateBegan) {
        self.startPointMoveView = [panGesture locationInView:[self.rectangleView superview]];
    } else if(panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint endPoint = [panGesture locationInView:[self.rectangleView superview]];
        CGRect frame = panGesture.view.frame;
        frame.origin.x += endPoint.x - self.startPointMoveView.x;
        frame.origin.y += endPoint.y - self.startPointMoveView.y;
        frame.origin.x = MIN(maxX, MAX(frame.origin.x, minX));
        frame.origin.y = MIN(maxY, MAX(frame.origin.y, minY));
        panGesture.view.frame = frame;
        self.startPointMoveView = endPoint;
    }
}

@end
