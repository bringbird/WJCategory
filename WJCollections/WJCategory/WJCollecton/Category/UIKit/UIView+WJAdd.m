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

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (CGFloat)visibleAlpha {
    if ([self isKindOfClass:[UIWindow class]]) {
        if (self.hidden) return 0;
        return self.alpha;
    }
    if (!self.window) return 0;
    CGFloat alpha = 1;
    UIView *v = self;
    while (v) {
        if (v.hidden) {
            alpha = 0;
            break;
        }
        alpha *= v.alpha;
        v = v.superview;
    }
    return alpha;
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

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (NSData *)snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData* data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (CGPoint)convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point toWindow:nil];
        } else {
            return [self convertPoint:point toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point toView:view];
    point = [self convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    point = [view convertPoint:point fromView:to];
    return point;
}

- (CGPoint)convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point fromWindow:nil];
        } else {
            return [self convertPoint:point fromView:nil];
        }
    }
    
    UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point fromView:view];
    point = [from convertPoint:point fromView:view];
    point = [to convertPoint:point fromWindow:from];
    point = [self convertPoint:point fromView:to];
    return point;
}

- (CGRect)convertRect:(CGRect)rect toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect toWindow:nil];
        } else {
            return [self convertRect:rect toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if (!from || !to) return [self convertRect:rect toView:view];
    if (from == to) return [self convertRect:rect toView:view];
    rect = [self convertRect:rect toView:from];
    rect = [to convertRect:rect fromWindow:from];
    rect = [view convertRect:rect fromView:to];
    return rect;
}

- (CGRect)convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect fromWindow:nil];
        } else {
            return [self convertRect:rect fromView:nil];
        }
    }
    
    UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertRect:rect fromView:view];
    rect = [from convertRect:rect fromView:view];
    rect = [to convertRect:rect fromWindow:from];
    rect = [self convertRect:rect fromView:to];
    return rect;
}

@end
