//
//  WJMBHUD.h
//  WJHUD
//  
//  Created by bringbird on 2016/12/10.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

/**
 此 'MBProgressHUD‘ 的版本为0.9.2，用此版本是因为HUD背景色为黑色 而大于0.9.2的为白色。
 将 'MBProgressHUD.m' 文件中 第 574 行 'yPos += kPadding;' 替换成
 ‘yPos += kPadding + mode == MBProgressHUDModeText ? 0 : 10;'
 即可将提示图片和提示文本间的间距调至与顶部和底部基本一致。
 */

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

/**
 *  A simple class to display HUD.
 */
@interface WJMBHUD : NSObject

/**
 * Hide HUD.
 */
+ (void)hideHUD;

/**
 *  Show activity HUD like 'UIActivityIndicatorView'.
 *
 *  @Note Use '+hideHUD' to stop it.
 *
 *  @param message Loading message.
 */
+ (void)showActivity:(nullable NSString *)message;

/**
 *  Show only label HUD.
 *
 *  @param message Toast message (non-null).
 *  @param duration The Toast druation time.
 */
+ (void)showToast:(nonnull NSString *)message duration:(NSTimeInterval)duration;
+ (void)showToast:(nonnull NSString *)message; // The HUD druation time is 1.5 second.

/**
 *  Show warning HUD like ❗️.
 *
 *  @param warning Warning message.
 *  @param duration The HUD duration time.
 */
+ (void)showWarning:(nullable NSString *)warning duration:(NSTimeInterval)duration;
+ (void)showWarning:(nullable NSString *)warning; // The HUD druation time is 1.5 second.

/**
 *  Show error HUD like ✖️.
 *
 *  @param error Error message.
 *  @param duration The HUD duration time.
 */
+ (void)showError:(nullable NSString *)error duration:(NSTimeInterval)duration;
+ (void)showError:(nullable NSString *)error; // The HUD druation time is 1.5 second.

/**
 *  Show success HUD like ✔️.
 *
 *  @param success Success message.
 *  @param duration The HUD duration time.
 */
+ (void)showSuccess:(nullable NSString *)success duration:(NSTimeInterval)duration;
+ (void)showSuccess:(nullable NSString *)success; // The HUD druation time is 1.5 second.

+ (instancetype)new  UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

@end
NS_ASSUME_NONNULL_END
