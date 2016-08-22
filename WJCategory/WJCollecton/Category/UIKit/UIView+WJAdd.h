//
//  UIView+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 圆角类型
typedef NS_ENUM(NSInteger,WJCornerType) {
    WJCornerType_Top = 0,       ///<  顶部
    WJCornerType_Left,          ///<  左边
    WJCornerType_Bottom,        ///<  底部
    WJCornerType_Right,         ///<  右边
    WJCornerType_TopLeft,       ///<  左上
    WJCornerType_TopRight,      ///<  右上
    WJCornerType_BottomLeft,    ///<  左下
    WJCornerType_BottomRight,   ///<  右下
    WJCornerType_All,           ///<  全部
};

@interface UIView (WJAdd)
@property (nonatomic) CGFloat wj_left;
@property (nonatomic) CGFloat wj_top;
@property (nonatomic) CGFloat wj_right;
@property (nonatomic) CGFloat wj_bottom;
@property (nonatomic) CGFloat wj_width;
@property (nonatomic) CGFloat wj_height;
@property (nonatomic) CGFloat wj_centerX;
@property (nonatomic) CGFloat wj_centerY;
@property (nonatomic) CGPoint wj_origin;
@property (nonatomic) CGSize  wj_size;

/// 从 nib 文件加载 View
+ (instancetype)viewFromXib;

/// 设置 View 圆角，type   圆角类型，radius 圆角角度
- (void)cornerType:(WJCornerType)type withCornerRadius:(CGFloat)radius;



@end
