//
//  MBProgressHUD+WJAdd.m
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "MBProgressHUD+WJAdd.h"

@implementation MBProgressHUD (WJAdd)

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.0];
}

+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success.png" view:view];
}

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}

+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error {
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message {
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD {
    [self hideHUDForView:nil];
}

+ (void)showSuccess:(NSString *)success afterDelay:(NSTimeInterval)delay{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].windows.lastObject animated:YES];
    hud.labelText = success;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/success.png"]]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

+ (void)showError:(NSString *)error afterDelay:(NSTimeInterval)delay{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].windows.lastObject animated:YES];
    hud.labelText = error;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/error.png"]]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].windows.lastObject animated:YES];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

@end
