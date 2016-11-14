//
//  UIScrollView+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/24.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (WJAdd)

/// 动画地滑动至顶部。
- (void)scrollToTop;

/// 动画地滑动至底部。
- (void)scrollToBottom;

/// 动画地滑动至左边。
- (void)scrollToLeft;

/// 动画地滑动至右边。
- (void)scrollToRight;

/// 滑动至顶部，animated：是否需要动画。
- (void)scrollToTopAnimated:(BOOL)animated;

/// 滑动至底部，animated：是否需要动画。
- (void)scrollToBottomAnimated:(BOOL)animated;

/// 滑动至左边，animated：是否需要动画。
- (void)scrollToLeftAnimated:(BOOL)animated;

/// 滑动至右边，animated：是否需要动画。
- (void)scrollToRightAnimated:(BOOL)animated;

@end

typedef void(^KeyboardWillBeDismissedBlock)(void);
typedef void(^KeyboardDidHideBlock)(void);
typedef void(^KeyboardDidShowBlock)(BOOL didShowed);
typedef void(^KeyboardDidScrollToPointBlock)(CGPoint point);
typedef void(^KeyboardWillSnapBackToPointBlock)(CGPoint point);

typedef void(^KeyboardWillChangeBlock)(CGRect keyboardRect, UIViewAnimationOptions options, double duration, BOOL showKeyboard);

@interface UIScrollView (keyboard)

@property (nonatomic, weak) UIView *keyboardView;

@property (nonatomic, assign) CGFloat previousKeyboardY;

/**
 *  根据是否需要手势控制键盘消失注册键盘的通知
 *
 *  @param isPanGestured 手势的需要与否
 */
- (void)setupPanGestureControlKeyboardHide:(BOOL)isPanGestured;

/**
 *  不需要根据是否需要手势控制键盘消失remove键盘的通知，因为注册的时候，已经固定了这里是否需要释放手势对象了
 *
 *  @param isPanGestured 根据注册通知里面的YES or NO来进行设置
 */
- (void)disSetupPanGestureControlKeyboardHide:(BOOL)isPanGestured;

/**
 *  手势控制的时候，将要开始消失，在UIView的animation里，告诉键盘也需要跟着移动了，顺便需要移动inputView的位置
 */
@property (nonatomic, copy) KeyboardWillBeDismissedBlock keyboardWillBeDismissed;

/**
 *  键盘刚好隐藏
 */
@property (nonatomic, copy) KeyboardDidHideBlock keyboardDidHide;

/**
 *  键盘刚好变换完成
 */
@property (nonatomic, copy) KeyboardDidShowBlock keyboardDidChange;

/**
 *  手势控制键盘，滑动到某一点的回调
 */
@property (nonatomic, copy) KeyboardDidScrollToPointBlock keyboardDidScrollToPoint;

/**
 *  手势控制键盘，滑动到键盘以下的某个位置，然后又想撤销隐藏的手势，告诉键盘又要显示出来啦,顺便需要移动inputView的位置.
 */
@property (nonatomic, copy) KeyboardWillSnapBackToPointBlock keyboardWillSnapBackToPoint;

/**
 *  键盘状态改变的回调
 */
@property (nonatomic, copy) KeyboardWillChangeBlock keyboardWillChange;

/**
 *  手势控制键盘的偏移量
 */
@property (nonatomic, assign) CGFloat messageInputBarHeight;

@end
