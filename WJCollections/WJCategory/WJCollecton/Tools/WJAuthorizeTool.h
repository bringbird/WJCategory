//
//  WJAuthorizeTool.h
//  WJCategory
//
//  Created by bringbird on 16/8/27.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, AuthorizedStatu) {
    AuthorizedStatuAuthorized    = 1, ///< 明确授予权限
    AuthorizedStatuDenied        = 2, ///< 明确拒绝权限
    AuthorizedStatuRestricted    = 3, ///< 受限制
    AuthorizedStatuNotDetermined = 4, ///< 尚未允许还是拒绝
    AuthorizedStatuWhenInUse     = 5, ///< 允许在使用过程中访问
    AuthorizedStatuAlways        = 6  ///< 总是允许访问
};

/** System permissions detection tools */
@interface WJAuthorizeTool : NSObject

/// 是否开启摄像机权限
+ (BOOL)isOpenCameraAuthorized;

/** Registered camera permissions. */
+ (void)requestCameraAuthorized;

/** Get camera authority status. */
+ (AuthorizedStatu)getCameraAuthorized;

/// 是否开启相册权限
+ (BOOL)isOpenPhotoAuthorized;

/** Registered album permissions. */
+ (void)requestPhotoAuthorized;

/** Get album authority status. */
+ (AuthorizedStatu)getPhotoAuthorized;

/// 是否开启麦克风权限
+ (BOOL)isOpenAudioAuthorized;

/** Register the microphone permissions. */
+ (void)requestAudioAuthorized;

/** Get microphone authority status. */
+ (AuthorizedStatu)getAudioAuthorized;

/// 是否开启通知权限
+ (BOOL)isOpenAPNSAuthorized;

/** Register the user notification permissions. */
+ (void)requestAPNSAuthorized;

/// 是否开启定位权限
+ (BOOL)isOpenLocationAuthorized;

/** Registered location permissions, When in use. */
+ (void)requestLocationWhenUse;

/** Registered location permissions, Always. */
+ (void)requestLocationAlways;

/** Get locating authority status. */
+ (AuthorizedStatu)getLocationStatus;

+ (instancetype)new  UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
@end
