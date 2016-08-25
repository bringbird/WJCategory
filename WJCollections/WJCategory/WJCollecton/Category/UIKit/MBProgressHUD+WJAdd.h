//
//  MBProgressHUD+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (WJAdd)

/// 展示成功提示框到指定的 View 上，success 成功提示信息，view：指定的View
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

/// 展示错误提示框到指定的 View 上，success 错误提示信息，view：指定的View
+ (void)showError:(NSString *)error toView:(UIView *)view;

/// 展示提示信息到指定的View上，message 提示信息，view：指定的View
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

/// 展示纯文本的提示框，message 提示信息，delay   延迟隐藏时间
+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

/// 展示错误提示信息框， error 错误提示信息，delay 延迟隐藏时间
+ (void)showError:(NSString *)error afterDelay:(NSTimeInterval)delay;

/// 展示成功提示信息框，error 成功提示信息，delay 延迟隐藏时间
+ (void)showSuccess:(NSString *)success afterDelay:(NSTimeInterval)delay;

/// 展示成功信息的提示框，success 成功提示信息
+ (void)showSuccess:(NSString *)success;

/// 展示错误信息的提示框，error 错误提示信息
+ (void)showError:(NSString *)error;

/// 展示具有提示信息的菊花样式提示框，message 提示信息
+ (MBProgressHUD *)showMessage:(NSString *)message;

/// 隐藏提示框
+ (void)hideHUDForView:(UIView *)view;

/// 隐藏提示框
+ (void)hideHUD;

@end
