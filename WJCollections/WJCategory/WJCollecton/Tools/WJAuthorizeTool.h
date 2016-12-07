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

/// 系统权限监测工具
@interface WJAuthorizeTool : NSObject

/// 是否开启摄像机权限
+ (BOOL)isOpenVideoAuthorized;

/// 注册相机权限 
+ (void)requestVideoAuthorized;

/// 获取相机权限状态
+ (AuthorizedStatu)getVideoAuthorized;

/// 是否开启麦克风权限
+ (BOOL)isOpenAudioAuthorized;

/// 注册麦克风权限
+ (void)requestAudioAuthorized;

/// 获取麦克风权限状态
+ (AuthorizedStatu)getAudioAuthorized;

/// 是否开启通知权限
+ (BOOL)isOpenAPNSAuthorized;

/// 注册通知
+ (void)requestAPNSAuthorized;

/// 是否开启定位权限
+ (BOOL)isOpenLocationAuthorized;

/// 注册定位权限
+ (void)requestLocationWhenUse;

/// 注册定位权限
+ (void)requestLocationAlways;

/// 获取定位权限状态
+ (AuthorizedStatu)getLocationStatus;
@end
