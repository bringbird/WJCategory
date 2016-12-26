//
//  WJMBHUD.m
//  WJHUD
//
//  Created by bringbird on 2016/12/10.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJMBHUD.h"
#import <MBProgressHUD.h>

static NSTimeInterval _defaultDuration = 1.5f;

typedef NS_OPTIONS(NSUInteger, WJHUDType) {
    WJHUDTypeToast      = 1 << 0,
    WJHUDTypeError      = 1 << 1,
    WJHUDTypeWarning    = 1 << 2,
    WJHUDTypeSuccess    = 1 << 3,
    WJHUDTypeActivity   = 1 << 4,
};

@implementation WJMBHUD

#pragma mark - Class Method

+ (void)hideHUD {
    [MBProgressHUD hideHUDForView:wj_hudView() animated:YES];
}

+ (void)showActivity:(NSString *)message {
    wj_showHUD(message, WJHUDTypeActivity, 0);
}

+ (void)showToast:(NSString *)message duration:(NSTimeInterval)duration {
    !message.length ?: wj_showHUD(message, WJHUDTypeToast, duration);
}
+ (void)showToast:(NSString *)message {
    [self showToast:message duration:_defaultDuration];
}

+ (void)showWarning:(NSString *)warning duration:(NSTimeInterval)duration {
    wj_showHUD(warning, WJHUDTypeWarning, duration);
}
+ (void)showWarning:(NSString *)warning {
    [self showWarning:warning duration:_defaultDuration];
}

+ (void)showSuccess:(NSString *)success duration:(NSTimeInterval)duration {
    wj_showHUD(success, WJHUDTypeSuccess, duration);
}
+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success duration:_defaultDuration];
}

+ (void)showError:(NSString *)error duration:(NSTimeInterval)duration {
    wj_showHUD(error, WJHUDTypeError, duration);
}
+ (void)showError:(NSString *)error {
    [self showError:error duration:_defaultDuration];
}

#pragma mark - Private Method

UIView *wj_hudView() {
    return UIApplication.sharedApplication.windows.lastObject;
}

UIImageView *wj_customView(NSString *imageName) {
    NSString *image = [NSString stringWithFormat:@"WJHUD.bundle/%@.png",imageName];
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
}

void wj_showHUD(NSString *message,WJHUDType type,NSTimeInterval duration) {
    [MBProgressHUD hideHUDForView:wj_hudView() animated:NO];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:wj_hudView() animated:YES];
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    if (type != WJHUDTypeActivity) {
        if (type == WJHUDTypeToast) {
            hud.margin = 12.0f; // default is 20.0
            hud.mode = MBProgressHUDModeText;
        } else {
            NSString *imageName;
            switch (type) {
                case WJHUDTypeWarning:{
                    imageName = @"warning";
                } break;
                case WJHUDTypeError:{
                    imageName = @"error";
                }  break;
                case WJHUDTypeSuccess:{
                    imageName = @"success";
                } break;
                default:break;
            }
            hud.customView = wj_customView(imageName);
            hud.mode = MBProgressHUDModeCustomView;
        }
        duration = duration <= 0 ? _defaultDuration : duration;
        [hud hide:YES afterDelay:duration];
    }
}

@end
