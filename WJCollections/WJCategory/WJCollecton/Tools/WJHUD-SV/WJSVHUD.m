//
//  WJSVHUD.m
//  WJHUD
//
//  Created by bringbird on  2016/12/10.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJSVHUD.h"
#import <SVProgressHUD.h>

typedef NS_OPTIONS(NSUInteger, WJHUDType) {
    WJHUDTypeToast      = 1 << 0,
    WJHUDTypeError      = 1 << 1,
    WJHUDTypeWarning    = 1 << 2,
    WJHUDTypeSuccess    = 1 << 3,
    WJHUDTypeActivity   = 1 << 4,
};

static NSTimeInterval _dufaultDuration = 1.5f;

@implementation WJSVHUD

#pragma mark - Class Method

+ (void)hideHUD {
    [SVProgressHUD dismiss];
}

+ (void)showActivity:(NSString *)message {
    WJ_ShowHUD(message, WJHUDTypeActivity, 0);
}

+ (void)showWarning:(NSString *)info duration:(NSTimeInterval)duration {
    WJ_ShowHUD(info, WJHUDTypeWarning, duration);
}

+ (void)showWarning:(NSString *)info {
    [self showWarning:info duration:_dufaultDuration];
}

+ (void)showError:(NSString *)error duration:(NSTimeInterval)duration {
    WJ_ShowHUD(error, WJHUDTypeError, duration);
}

+ (void)showError:(NSString *)error {
    [self showError:error duration:_dufaultDuration];
}

+ (void)showSuccess:(NSString *)success duration:(NSTimeInterval)duration {
    WJ_ShowHUD(success, WJHUDTypeSuccess, duration);
}

+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success duration:_dufaultDuration];
}

+ (void)showToast:(NSString *)message duration:(NSTimeInterval)duration {
    !message.length ?: WJ_ShowHUD(message, WJHUDTypeToast, _dufaultDuration);
}

+ (void)showToast:(NSString *)message {
    [self showToast:message duration:_dufaultDuration];
}


#pragma mark - Private Methods

void WJ_ShowHUD(NSString *message,WJHUDType type,NSTimeInterval duration) {
    [SVProgressHUD dismiss];
    message = [message isKindOfClass:[NSNull class]] ? nil : message;
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear]; // dufault is SVProgressHUDMaskTypeNone
    if (type == WJHUDTypeActivity) {
        [SVProgressHUD showWithStatus:message];
    } else {
        switch (type) {
            case WJHUDTypeWarning: {
                [SVProgressHUD showInfoWithStatus:message];
            }
                break;
            case WJHUDTypeError: {
                [SVProgressHUD showErrorWithStatus:message];
            }
                break;
            case WJHUDTypeSuccess: {
                [SVProgressHUD showSuccessWithStatus:message];
            }
                break;
            case WJHUDTypeToast: {
                [SVProgressHUD setCornerRadius:10.0f]; // default is 14.0f
                [SVProgressHUD showImage:nil status:message];
            }
                break;
            default:break;
        }
        duration = duration <= 0 ? _dufaultDuration : duration;
        [SVProgressHUD dismissWithDelay:duration];
    }
}
@end
