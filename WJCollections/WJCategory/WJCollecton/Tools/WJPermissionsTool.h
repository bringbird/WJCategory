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

/// 获取相机权限 return：相机权限
+ (PermissionsType)getVideoPerssion;

/// 获取麦克风权限 return：麦克风权限
+ (PermissionsType)getAudioPerssion;

@end
