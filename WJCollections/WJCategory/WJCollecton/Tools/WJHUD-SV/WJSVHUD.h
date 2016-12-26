//
//  WJSVHUD.h
//  WJHUD
//
//  Created by bringbird on  2016/12/10.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

/**
 *  A simple class to display HUD.
 */
@interface WJSVHUD : NSObject

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
