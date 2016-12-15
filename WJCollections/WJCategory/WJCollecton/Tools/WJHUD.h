//
//  WJHUD.h
//  WJCategory
//
//  Created by bringbird on 16/10/23.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

/**
 A simple class to display tips message.
 */
@interface WJHUD : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

/**
 hide HUD.
 */
+ (void)hideHUD;

/**
 Show activity HUD like 'UIActivityIndicatorView'.
 
 @discussion Use '[WJHUD hideHUD]' to stop.
 
 @param message tips message.
 */
+ (void)showActivityWihtMessage:(nullable NSString *)message;

/**
 Show only label HUD.
 
 @param message tips message
 @param duration The HUD druation time.
 */
+ (void)showMessage:(nullable NSString *)message duration:(NSTimeInterval)duration;
+ (void)showMessage:(nullable NSString *)message; // The HUD druation time is 1.5 second.
/**
 Show warming HUD like '❗️'.
 
 @param info Tips message.
 @param duration The HUD duration time.
 */
+ (void)showInfo:(nullable NSString *)info duration:(NSTimeInterval)duration;
+ (void)showInfo:(nullable NSString *)info; // The HUD druation time is 1.5 second.
/**
 Show Error HUD like '✖️'.
 
 @param error Tips message.
 @param duration The HUD duration time.
 */
+ (void)showError:(nullable NSString *)error duration:(NSTimeInterval)duration;
+ (void)showError:(nullable NSString *)error; // The HUD druation time is 1.5 second.

/**
 Show success HUD like '✔️'.
 
 @param success Tips message.
 @param duration The HUD duration time.
 */
+ (void)showSuccess:(nullable NSString *)success duration:(NSTimeInterval)duration;
+ (void)showSuccess:(nullable NSString *)success; // The HUD druation time is 1.5 second.

@end
NS_ASSUME_NONNULL_END
