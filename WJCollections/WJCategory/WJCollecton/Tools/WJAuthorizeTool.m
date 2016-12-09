//
//  WJAuthorizeTool.m
//  WJCategory
//
//  Created by bringbird on 16/8/27.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJAuthorizeTool.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@implementation WJAuthorizeTool

+ (BOOL)isOpenAPNSAuthorized {
    if ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]) {
        return YES;
    } else return NO;
}

+ (void)requestAPNSAuthorized {
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotifications)]) {
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
}

// 检查视频权限
+ (BOOL)isOpenVideoAuthorized {
    return [self getAuthorizedWityMediaType:AVMediaTypeVideo] == AuthorizedStatuAuthorized;
}

+ (BOOL)isOpenAudioAuthorized {
    return [self getAuthorizedWityMediaType:AVMediaTypeAudio] == AuthorizedStatuAuthorized;
}

+ (void)requestAudioAuthorized {
    [self requestMedia:AVMediaTypeAudio];
}

+ (AuthorizedStatu)getAudioAuthorized {
    return [self getAuthorizedWityMediaType:AVMediaTypeAudio];
}

+ (void)requestVideoAuthorized {
    [self requestMedia:AVMediaTypeVideo];
}

+ (void)requestMedia:(NSString *)media {
    [AVCaptureDevice requestAccessForMediaType:media completionHandler:nil];
}

+ (AuthorizedStatu)getVideoAuthorized {
    return [self getAuthorizedWityMediaType:AVMediaTypeVideo];
}

+ (AuthorizedStatu)getAuthorizedWityMediaType:(NSString *)mediatype {
    AuthorizedStatu Astatu;
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:mediatype];
    switch (status) {
        case AVAuthorizationStatusNotDetermined: {
            Astatu = AuthorizedStatuNotDetermined;
            break;
        }
        case AVAuthorizationStatusRestricted: {
            Astatu = AuthorizedStatuRestricted;
            break;
        }
        case AVAuthorizationStatusDenied: {
            Astatu = AuthorizedStatuDenied;
            break;
        }
        case AVAuthorizationStatusAuthorized: {
            Astatu = AuthorizedStatuAuthorized;
            break;
        }
    }
    return Astatu;
}

+ (BOOL)isOpenLocationAuthorized {
    AuthorizedStatu status = [self getLocationStatus];
    if (status == AuthorizedStatuAlways || status == AuthorizedStatuWhenInUse) return YES;
    return NO;
}

+ (void)requestLocationWhenUse {
    [[[CLLocationManager alloc]init] requestWhenInUseAuthorization];
}

+ (void)requestLocationAlways {
    [[[CLLocationManager alloc]init] requestAlwaysAuthorization];
}

+ (AuthorizedStatu)getLocationStatus {
    CLAuthorizationStatus statu = [CLLocationManager authorizationStatus];
    AuthorizedStatu Astatu;
    switch (statu) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            Astatu =  AuthorizedStatuWhenInUse;
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            Astatu =  AuthorizedStatuAlways;
            break;
        case kCLAuthorizationStatusDenied:
            Astatu =  AuthorizedStatuDenied;
            break;
        case kCLAuthorizationStatusRestricted:
            Astatu =  AuthorizedStatuRestricted;
            break;
        case kCLAuthorizationStatusNotDetermined:
            Astatu =  AuthorizedStatuNotDetermined;
            break;
        default: break;
    }
    return Astatu;
}

@end
