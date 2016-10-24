//
//  WJPermissionsTool.h
//  WJCategory
//
//  Created by bringbird on 16/8/27.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, PermissionsType) {
    PermissionsTypeAuthorized       = 1,    ///< 明确授予权限
    PermissionsTypeDenied           = 2,    ///< 明确拒绝权限
    PermissionsTypeRestricted       = 3,    ///< 受限制
    PermissionsTypeNotDetermined    = 4     ///< 尚未允许还是拒绝
};

@interface WJPermissionsTool : NSObject

/// 注册相机权限 return：摄像机权限
+ (PermissionsType)registerVideoPerssion;

/// 注册麦克风权限 return：麦克风权限
+ (PermissionsType)registerAudioPerssion;

/// 注册通知
+ (void)registerAPNS;

/// 是否开启摄像机权限
+ (BOOL)isOpenVideoPerssion;

/// 是否已获取麦克风权限
+ (BOOL)isOpenAudioPerssion;

/// 是否开启通知权限
+ (BOOL)isOpenAPNS;

@end
