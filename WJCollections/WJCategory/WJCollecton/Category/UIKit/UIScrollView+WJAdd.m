//
//  UIScrollView+WJAdd.m
//  WJCategory
//
//  Created by bringbird on 16/8/24.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "UIScrollView+WJAdd.h"
#import <objc/runtime.h>

@implementation UIScrollView (WJAdd)

- (void)scrollToTop {
    [self scrollToTopAnimated:YES];
}

- (void)scrollToBottom {
    [self scrollToBottomAnimated:YES];
}

- (void)scrollToLeft {
    [self scrollToLeftAnimated:YES];
}

- (void)scrollToRight {
    [self scrollToRightAnimated:YES];
}

- (void)scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end


static NSString * const kKeyboardWillBeDismissedKey = @"kKeyboardWillBeDismissedKey";
static NSString * const kKeyboardDidHideKey = @"kKeyboardDidHideKey";
static NSString * const kKeyboardDidChangeKey = @"kKeyboardDidChangeKey";
static NSString * const kKeyboardDidScrollToPointKey = @"kKeyboardDidScrollToPointKey";
static NSString * const kKeyboardWillSnapBackToPointKey = @"kKeyboardWillSnapBackToPointKey";
static NSString * const kKeyboardWillChangeKey = @"kKeyboardWillChangeKey";
static NSString * const kKeyboardViewKey = @"kKeyboardViewKey";
static NSString * const kPreviousKeyboardYKey = @"kPreviousKeyboardYKey";
static NSString * const kInputBarHeightKey = @"kInputBarHeightKey";

@implementation UIScrollView (keyboard)

- (void)setKeyboardWillBeDismissed:(KeyboardWillBeDismissedBlock)keyboardWillBeDismissed {
    objc_setAssociatedObject(self, &kKeyboardWillBeDismissedKey, keyboardWillBeDismissed, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (KeyboardWillBeDismissedBlock)keyboardWillBeDismissed {
    return objc_getAssociatedObject(self, &kKeyboardWillBeDismissedKey);
}

- (void)setKeyboardDidHide:(KeyboardDidHideBlock)keyboardDidHide {
    objc_setAssociatedObject(self, &kKeyboardDidHideKey, keyboardDidHide, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (KeyboardDidHideBlock)keyboardDidHide {
    return objc_getAssociatedObject(self, &kKeyboardDidHideKey);
}

- (void)setKeyboardDidChange:(KeyboardDidShowBlock)keyboardDidChange {
    objc_setAssociatedObject(self, &kKeyboardDidChangeKey, keyboardDidChange, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (KeyboardDidShowBlock)keyboardDidChange {
    return objc_getAssociatedObject(self, &kKeyboardDidChangeKey);
}

- (void)setKeyboardWillSnapBackToPoint:(KeyboardWillSnapBackToPointBlock)keyboardWillSnapBackToPoint {
    objc_setAssociatedObject(self, &kKeyboardWillSnapBackToPointKey, keyboardWillSnapBackToPoint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (KeyboardWillSnapBackToPointBlock)keyboardWillSnapBackToPoint {
    return objc_getAssociatedObject(self, &kKeyboardWillSnapBackToPointKey);
}

- (void)setKeyboardDidScrollToPoint:(KeyboardDidScrollToPointBlock)keyboardDidScrollToPoint {
    objc_setAssociatedObject(self, &kKeyboardDidScrollToPointKey, keyboardDidScrollToPoint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (KeyboardDidScrollToPointBlock)keyboardDidScrollToPoint {
    return objc_getAssociatedObject(self, &kKeyboardDidScrollToPointKey);
}

- (void)setKeyboardWillChange:(KeyboardWillChangeBlock)keyboardWillChange {
    objc_setAssociatedObject(self, &kKeyboardWillChangeKey, keyboardWillChange, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (KeyboardWillChangeBlock)keyboardWillChange {
    return objc_getAssociatedObject(self, &kKeyboardWillChangeKey);
}

- (void)setKeyboardView:(UIView *)keyboardView {
    objc_setAssociatedObject(self, &kKeyboardViewKey, keyboardView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)keyboardView {
    return objc_getAssociatedObject(self, &kKeyboardViewKey);
}

- (void)setPreviousKeyboardY:(CGFloat)previousKeyboardY {
    objc_setAssociatedObject(self, &kPreviousKeyboardYKey, [NSNumber numberWithFloat:previousKeyboardY], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)previousKeyboardY {
    return [objc_getAssociatedObject(self, &kPreviousKeyboardYKey) floatValue];
}

- (void)setMessageInputBarHeight:(CGFloat)messageInputBarHeight {
    objc_setAssociatedObject(self, &kInputBarHeightKey, [NSNumber numberWithFloat:messageInputBarHeight], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)messageInputBarHeight {
    return [objc_getAssociatedObject(self, &kInputBarHeightKey) floatValue];
}

#pragma mark - Helper Method

+ (UIView *)findKeyboard {
    UIView *keyboardView = nil;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    //逆序效率更高，因为键盘总在上方
    for (UIWindow *window in [windows reverseObjectEnumerator]) {
        keyboardView = [self findKeyboardInView:window];
        if (keyboardView) {
            return keyboardView;
        }
    }
    return nil;
}

+ (UIView *)findKeyboardInView:(UIView *)view {
    for (UIView *subView in [view subviews]) {
        if (strstr(object_getClassName(subView), "UIKeyboard")) {
            return subView;
        } else {
            UIView *tempView = [self findKeyboardInView:subView];
            if (tempView) {
                return tempView;
            }
        }
    }
    return nil;
}

- (void)setupPanGestureControlKeyboardHide:(BOOL)isPanGestured {
    [self addObserverWithSEL:@selector(handleWillShowKeyboardNotification:) name:UIKeyboardWillShowNotification];
    [self addObserverWithSEL:@selector(handleWillHideKeyboardNotification:) name:UIKeyboardWillHideNotification];
    [self addObserverWithSEL:@selector(handleKeyboardWillShowHideNotification:) name:UIKeyboardDidShowNotification];
    [self addObserverWithSEL:@selector(handleKeyboardWillShowHideNotification:) name:UIKeyboardDidHideNotification];
    if (isPanGestured) [self.panGestureRecognizer addTarget:self action:@selector(handlePanGesture:)];
}

- (void)disSetupPanGestureControlKeyboardHide:(BOOL)isPanGestured {
    [self removeObserverWithName:UIKeyboardWillShowNotification];
    [self removeObserverWithName:UIKeyboardWillHideNotification];
    [self removeObserverWithName:UIKeyboardDidShowNotification];
    [self removeObserverWithName:UIKeyboardWillShowNotification];
    [self removeObserverWithName:UIKeyboardDidHideNotification];
    if (isPanGestured) [self.panGestureRecognizer removeTarget:self action:@selector(handlePanGesture:)];
}

- (void)addObserverWithSEL:(SEL)sel name:(NSString *)name {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:sel name:name object:nil];
}

- (void)removeObserverWithName:(NSString *)name {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
}

#pragma mark - Gestures

- (void)handlePanGesture:(UIPanGestureRecognizer *)pan {
    if(!self.keyboardView || self.keyboardView.hidden)
        return;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    UIWindow *panWindow = [[UIApplication sharedApplication] keyWindow];
    CGPoint location = [pan locationInView:panWindow];
    location.y += self.messageInputBarHeight;
    CGPoint velocity = [pan velocityInView:panWindow];
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            self.previousKeyboardY = self.keyboardView.frame.origin.y;
            break;
        case UIGestureRecognizerStateEnded:
            if(velocity.y > 0 && self.keyboardView.frame.origin.y > self.previousKeyboardY) {
                [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.keyboardView.frame = CGRectMake(0.0f, screenHeight, self.keyboardView.frame.size.width, self.keyboardView.frame.size.height);
                    if (self.keyboardWillBeDismissed) {
                        self.keyboardWillBeDismissed();
                    }
                } completion:^(BOOL finished) {
                    self.keyboardView.hidden = YES;
                    self.keyboardView.frame = CGRectMake(0.0f, self.previousKeyboardY, self.keyboardView.frame.size.width, self.keyboardView.frame.size.height);
                    [self resignFirstResponder];
                    if (self.keyboardDidHide) {
                        self.keyboardDidHide();
                    }
                }];
            } else { // gesture ended with no flick or a flick upwards, snap keyboard back to original position
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    if (self.keyboardWillSnapBackToPoint) {
                        self.keyboardWillSnapBackToPoint(CGPointMake(0.0f, self.previousKeyboardY));
                    }
                    self.keyboardView.frame = CGRectMake(0.0f, self.previousKeyboardY, self.keyboardView.frame.size.width, self.keyboardView.frame.size.height);
                } completion:NULL];
            }
            break;
            
            // gesture is currently panning, match keyboard y to touch y
        default:
            if(location.y > self.keyboardView.frame.origin.y || self.keyboardView.frame.origin.y != self.previousKeyboardY) {
                CGFloat newKeyboardY = self.previousKeyboardY + (location.y - self.previousKeyboardY);
                newKeyboardY = newKeyboardY < self.previousKeyboardY ? self.previousKeyboardY : newKeyboardY;
                newKeyboardY = newKeyboardY > screenHeight ? screenHeight : newKeyboardY;
                self.keyboardView.frame = CGRectMake(0.0f, newKeyboardY, self.keyboardView.frame.size.width, self.keyboardView.frame.size.height);
                if (self.keyboardDidScrollToPoint) {
                    self.keyboardDidScrollToPoint(CGPointMake(0.0f, newKeyboardY));
                }
            }
            break;
    }
}

#pragma mark - Keyboard notifications

- (void)handleKeyboardWillShowHideNotification:(NSNotification *)notification {
    BOOL didShowed = YES;
    if([notification.name isEqualToString:UIKeyboardDidShowNotification]) {
        self.keyboardView = [UIScrollView findKeyboard].superview;
        self.keyboardView.hidden = NO;
        didShowed = YES;
    } else if([notification.name isEqualToString:UIKeyboardDidHideNotification]) {
        didShowed = NO;
        self.keyboardView.hidden = NO;
        [self resignFirstResponder];
    }
    if (self.keyboardDidChange) {
        self.keyboardDidChange(didShowed);
    }
}

- (void)handleWillShowKeyboardNotification:(NSNotification *)notification {
    self.keyboardView.hidden = NO;
    [self keyboardWillShowHide:notification];
}

- (void)handleWillHideKeyboardNotification:(NSNotification *)notification {
    [self keyboardWillShowHide:notification];
}

- (void)keyboardWillShowHide:(NSNotification *)notification {
    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    UIViewAnimationCurve curve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (self.keyboardWillChange) {
        self.keyboardWillChange(keyboardRect, [self animationOptionsForCurve:curve], duration, (([notification.name isEqualToString:UIKeyboardWillShowNotification]) ? YES : NO));
    }
}

- (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve {
    switch (curve) {
        case UIViewAnimationCurveEaseInOut:
            return UIViewAnimationOptionCurveEaseInOut;
        case UIViewAnimationCurveEaseIn:
            return UIViewAnimationOptionCurveEaseIn;
        case UIViewAnimationCurveEaseOut:
            return UIViewAnimationOptionCurveEaseOut;
        case UIViewAnimationCurveLinear:
            return UIViewAnimationOptionCurveLinear;
        default:
            return kNilOptions;
    }
}

@end
