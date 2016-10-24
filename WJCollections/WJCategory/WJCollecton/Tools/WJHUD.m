//
//  WJHUD.m
//  WJCategory
//
//  Created by bringbird on 16/10/23.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJHUD.h"

@implementation WJHUD
+ (void)showMessage:(NSString *)message {
//    message = [message isKindOfClass:[NSNull class]] ? nil : message; // 错误检查
//    [SVProgressHUD showWithStatus:message];
}

+ (void)showSuccess:(NSString *)success hideAfter:(NSTimeInterval)after {
//    success = [success isKindOfClass:[NSNull class]] ? nil : success; // 错误检查
//    [SVProgressHUD showSuccessWithStatus:success];
//    [self dispatchOnMainQueueAfter:after];
}

+ (void)showError:(NSString *)error hideAfter:(NSTimeInterval)after {
//    error = [error isKindOfClass:[NSNull class]] ? nil : error; // 错误检查
//    [SVProgressHUD showErrorWithStatus:error];
//    [self dispatchOnMainQueueAfter:after];
}

+ (void)showInfo:(NSString *)info hideAfter:(NSTimeInterval)after {
//    info = [info isKindOfClass:[NSNull class]] ? nil : info; // 错误检查
//    [SVProgressHUD showInfoWithStatus:info];
//    [self dispatchOnMainQueueAfter:after];
}

+ (void)dispatchOnMainQueueAfter:(NSTimeInterval)after {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(after * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hideHUD];
//    });
}

+ (void)hideHUD {
//    [self hideHUDAfter:0.0];
}

+ (void)hideHUDAfter:(NSTimeInterval)after {
//    [SVProgressHUD dismissWithDelay:after];
}
@end
