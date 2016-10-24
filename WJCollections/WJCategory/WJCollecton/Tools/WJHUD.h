//
//  WJHUD.h
//  WJCategory
//
//  Created by bringbird on 16/10/23.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJHUD : NSObject

/// 提示信息，message：提示信息
+ (void)showMessage:(nullable NSString *)message;

/// 展示成功提示信息，after：自动隐藏的时间
+ (void)showSuccess:(nullable NSString *)success hideAfter:(NSTimeInterval)after;

/// 展示错误提示信息，after：自动隐藏的时间
+ (void)showError:(nullable NSString *)error hideAfter:(NSTimeInterval)after;

/// 展示提示信息，after：自动隐藏的时间
+ (void)showInfo:(nullable NSString *)info hideAfter:(NSTimeInterval)after;

/// 隐藏
+ (void)hideHUD;
@end
