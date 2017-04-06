//
//  UIScrollView+WJ.h
//  WJCategory
//
//  Created by bringbird on 16/8/24.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (WJ)

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
