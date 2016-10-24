//
//  WJPermissionsTool.m
//  WJCategory
//
//  Created by bringbird on 16/8/27.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJPermissionsTool.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

/// 系统版本
static inline double systemVersion() {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}

@implementation WJPermissionsTool

+ (PermissionsType)registerVideoPerssion {
    return [self registerPressionWityMediaType:AVMediaTypeVideo];
}

+ (PermissionsType)registerAudioPerssion {
    return [self registerPressionWityMediaType:AVMediaTypeAudio];
}

+ (void)registerAPNS {
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotifications)]) {
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
}

+ (BOOL)isOpenVideoPerssion {
    if(systemVersion() >= 7.0) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusAuthorized) {
            return YES;
        } else return NO;
    }
    return NO;
}

+ (BOOL)isOpenAudioPerssion {
    if(systemVersion() >= 7.0) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
        if (status == AVAuthorizationStatusAuthorized) {
            return YES;
        } else return NO;
    }
    return NO;
}

+ (BOOL)isOpenAPNS {
    if ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]) {
        return YES;
    } else return NO;
}

+ (PermissionsType)registerPressionWityMediaType:(NSString *)mediatype {
    __block PermissionsType type;
    if(systemVersion() >= 7.0) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:mediatype];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {[AVCaptureDevice requestAccessForMediaType:mediatype completionHandler:^(BOOL granted) {
                if (granted) {
                    type = PermissionsTypeAuthorized;
                } else type = PermissionsTypeDenied;
            }];
                break;
            }
            case AVAuthorizationStatusRestricted: {
                type = PermissionsTypeRestricted;
                break;
            }
            case AVAuthorizationStatusDenied: {
                type = PermissionsTypeDenied;
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                type = PermissionsTypeAuthorized;
                break;
            }
        }
    }
    return type;
}

@end
