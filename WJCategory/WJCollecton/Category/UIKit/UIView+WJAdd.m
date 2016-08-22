//
//  UIView+WJAdd.m
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "UIView+WJAdd.h"

@implementation UIView (WJAdd)

- (CGFloat)wj_left {
    return self.frame.origin.x;
}

- (void)setWj_left:(CGFloat)wj_left {
    CGRect frame = self.frame;
    frame.origin.x = wj_left;
    self.frame = frame;
}

- (CGFloat)wj_top {
    return self.frame.origin.y;
}

- (void)setWj_top:(CGFloat)wj_top {
    CGRect frame = self.frame;
    frame.origin.y = wj_top;
    self.frame = frame;
}

- (CGFloat)wj_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setWj_right:(CGFloat)wj_right {
    CGRect frame = self.frame;
    frame.origin.x = wj_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)wj_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setWj_bottom:(CGFloat)wj_bottom {
    CGRect frame = self.frame;
    frame.origin.y = wj_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)wj_width {
    return self.frame.size.width;
}

- (void)setWj_width:(CGFloat)wj_width {
    CGRect frame = self.frame;
    frame.size.width = wj_width;
    self.frame = frame;
}

- (CGFloat)wj_height {
    return self.frame.size.height;
}

- (void)setWj_height:(CGFloat)wj_height {
    CGRect frame = self.frame;
    frame.size.height = wj_height;
    self.frame = frame;
}

- (CGFloat)wj_centerX {
    return self.center.x;
}

- (void)setWj_centerX:(CGFloat)wj_centerX {
    self.center = CGPointMake(wj_centerX, self.center.y);
}

- (CGFloat)wj_centerY {
    return self.center.y;
}

- (void)setWj_centerY:(CGFloat)wj_centerY {
    self.center = CGPointMake(self.center.x, wj_centerY);
}

- (CGPoint)wj_origin {
    return self.frame.origin;
}

- (void)setWj_origin:(CGPoint)wj_origin {
    CGRect frame = self.frame;
    frame.origin = wj_origin;
    self.frame = frame;
}

- (CGSize)wj_size {
    return self.frame.size;
}

- (void)setWj_size:(CGSize)wj_size {
    CGRect frame = self.frame;
    frame.size = wj_size;
    self.frame = frame;
}

+ (instancetype)viewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)cornerType:(WJCornerType)type withCornerRadius:(CGFloat)radius {
    CGSize cornerSize = CGSizeMake(radius, radius);
    UIBezierPath *maskPath;
    switch (type) {
        case WJCornerType_Top: {
            maskPath = [self cornerType:(UIRectCornerTopLeft|UIRectCornerTopRight) rect:cornerSize];
            break;
        }
        case WJCornerType_Left: {
            maskPath = [self cornerType:(UIRectCornerTopLeft|UIRectCornerBottomLeft) rect:cornerSize];
            break;
        }
        case WJCornerType_Bottom: {
            maskPath = [self cornerType:(UIRectCornerBottomLeft|UIRectCornerBottomRight) rect:cornerSize];
            break;
        }
        case WJCornerType_Right: {
            maskPath = [self cornerType:(UIRectCornerTopRight|UIRectCornerBottomRight) rect:cornerSize];
            break;
        }
        case WJCornerType_TopLeft: {
            maskPath = [self cornerType:UIRectCornerTopLeft rect:cornerSize];
            break;
        }
        case WJCornerType_TopRight: {
            maskPath = [self cornerType:UIRectCornerTopRight rect:cornerSize];
            break;
        }
        case WJCornerType_BottomLeft: {
            maskPath = [self cornerType:UIRectCornerBottomLeft rect:cornerSize];
            break;
        }
        case WJCornerType_BottomRight: {
            maskPath = [self cornerType:UIRectCornerBottomRight rect:cornerSize];
            break;
        }
        case WJCornerType_All: {
            maskPath = [self cornerType:UIRectCornerAllCorners rect:cornerSize];
            break;
        }
    }
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    [self.layer setMasksToBounds:YES];
}

- (UIBezierPath *)cornerType:(UIRectCorner)type rect:(CGSize)rect {
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:type cornerRadii:rect];
    return bezier;
}
@end
