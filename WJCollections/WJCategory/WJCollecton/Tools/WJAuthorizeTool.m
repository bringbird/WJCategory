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
#import <Photos/Photos.h>

static inline double systemVersion() {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}

@implementation WJAuthorizeTool

+ (BOOL)isOpenAPNSAuthorized {
    if ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]) {
        return YES;
    } else return NO;
}

+ (void)requestAPNSAuthorized {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotifications)]) {
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
#pragma clang diagnostic pop
}

+ (BOOL)isOpenCameraAuthorized {
    if(systemVersion() >= 7.0) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusAuthorized) {
            return YES;
        } else return NO;
    }
    return NO;
}

+ (BOOL)isOpenAudioAuthorized {
    if(systemVersion() >= 7.0) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
        if (status == AVAuthorizationStatusAuthorized) {
            return YES;
        } else return NO;
    }
    return NO;
}

+ (void)requestAudioAuthorized {
    [self requestMedia:AVMediaTypeAudio];
}

+ (AuthorizedStatu)getAudioAuthorized {
    return [self getAuthorizedWityMediaType:AVMediaTypeAudio];
}

+ (void)requestCameraAuthorized {
    [self requestMedia:AVMediaTypeVideo];
}

+ (void)requestMedia:(NSString *)media {
    [AVCaptureDevice requestAccessForMediaType:media completionHandler:nil];
}

+ (AuthorizedStatu)getCameraAuthorized {
    return [self getAuthorizedWityMediaType:AVMediaTypeVideo];
}

+ (AuthorizedStatu)getAuthorizedWityMediaType:(NSString *)mediatype {
    __block AuthorizedStatu Astatu = 0;
    if(systemVersion() >= 7.0) {
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
    }
    return Astatu;
}

+ (BOOL)isOpenPhotoAuthorized {
    AuthorizedStatu status = [WJAuthorizeTool getPhotoAuthorized];
    if (status == AuthorizedStatuAuthorized) return YES;
    return NO;
}

+ (void)requestPhotoAuthorized {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
    }];
}

+ (AuthorizedStatu)getPhotoAuthorized {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    AuthorizedStatu author;
    switch (status) {
        case PHAuthorizationStatusNotDetermined:
            author = AuthorizedStatuNotDetermined;
            break;
        case PHAuthorizationStatusRestricted:
            author = AuthorizedStatuRestricted;
            break;
        case PHAuthorizationStatusDenied:
            author = AuthorizedStatuDenied;
            break;
        case PHAuthorizationStatusAuthorized:
            author = AuthorizedStatuAuthorized;
            break;
    }
    return author;
}

+ (BOOL)isOpenLocationAuthorized {
    CLAuthorizationStatus statu = [CLLocationManager authorizationStatus];
    if (statu == kCLAuthorizationStatusAuthorizedWhenInUse || statu == kCLAuthorizationStatusAuthorizedAlways ) {
        return YES;
    } else return NO;
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
        default:
            break;
    }
    return Astatu;
}

@end
