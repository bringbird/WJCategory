//
//  WJHUD.m
//  WJCategory
//
//  Created by bringbird on 16/10/23.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJHUD.h"
#import <SVProgressHUD.h>

typedef NS_OPTIONS(NSUInteger, WJHUDType) {
    WJHUDTypeInfo       = 1 << 0,
    WJHUDTypeError      = 1 << 1,
    WJHUDTypeSuccess    = 1 << 2,
    WJHUDTypeActivity   = 1 << 3,
    WJHUDTypeOnlyLabel  = 1 << 4,
};

@implementation WJHUD

+ (void)hideHUD {
    [self hideHUDAfter:0.01f];
}

+ (void)showActivityWihtMessage:(NSString *)message {
    [self showHUDWithMessage:message type:WJHUDTypeActivity duration:0];
}

+ (void)showInfo:(NSString *)info duration:(NSTimeInterval)duration {
    [self showHUDWithMessage:info type:WJHUDTypeInfo duration:duration];
}

+ (void)showInfo:(NSString *)info {
    [self showInfo:info duration:1.5f];
}

+ (void)showError:(NSString *)error duration:(NSTimeInterval)duration {
    [self showHUDWithMessage:error type:WJHUDTypeError duration:duration];
}

+ (void)showError:(NSString *)error {
    [self showError:error duration:1.5f];
}

+ (void)showSuccess:(NSString *)success duration:(NSTimeInterval)duration {
    [self showHUDWithMessage:success type:WJHUDTypeSuccess duration:duration];
}

+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success duration:1.5f];
}

+ (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration {
    if (!message.length) message = @"😞 😞 😞 😞";
    [self showHUDWithMessage:message type:WJHUDTypeOnlyLabel duration:duration];
}

+ (void)showMessage:(NSString *)message {
    [self showMessage:message duration:1.5f];
}


#pragma mark - private methods
+ (void)showHUDWithMessage:(NSString *)message
                      type:(WJHUDType)type
                  duration:(NSTimeInterval)duration {
    message = [message isKindOfClass:[NSNull class]] ? nil : message;
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:16]];
    if (type == WJHUDTypeActivity) {
        [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
        [SVProgressHUD showWithStatus:message];
    } else {
        switch (type) {
                case WJHUDTypeInfo: {
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
                case WJHUDTypeOnlyLabel: {
                    [SVProgressHUD setCornerRadius:10];
                    [SVProgressHUD showImage:nil status:message];
                }
                break;
            default:break;
        }
        [self dispatchOnMainQueueAfter:duration];
    }
}

+ (void)hideHUDAfter:(NSTimeInterval)after {
    [SVProgressHUD dismissWithDelay:after];
}

+ (void)dispatchOnMainQueueAfter:(NSTimeInterval)after {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(after * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       [self hideHUD]; });
}
@end
