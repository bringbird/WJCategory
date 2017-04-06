//
//  WJNetworking.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, WJNetStatus) {
    WJNetStatusUnknown,  ///< 未知网络 
    WJNetStatusNone,     ///< 无网络
    WJNetStatusWWAN,     ///< 手机网络
    WJNetStatusWiFi      ///< WIFI网络
};

@interface WJNetworking : NSObject

/// 成功回调
typedef void (^successBlock)(id responseObject);

/// 失败回调
typedef void (^failureBlock)(NSError *error);

/// 网络状态监听回调
typedef void(^NetworkStatus)(WJNetStatus status);

/// 进度回调 
typedef void (^progressBlock)(NSProgress *progress);

/// 开启网络状态监听
+ (void)startMonitoringNetwork;

/// 可通过回调获取网络状态，也可直接获取网络是否可用
+ (void)checkNetworkStatusWithBlock:(NetworkStatus)statusBack;

/// POST 请求
+ (void)POST:(NSString *)URL parameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure;

/// GET 请求
+ (void)GET:(NSString *)URL parameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure;

/**
 * 图片上传
 *
 * @param URL        请求地址
 * @param parameters 参数
 * @param images     图片数组
 * @param name       文件对应服务器上的字段
 * @param fileName   文件名
 * @param mimeType   图片类型，默认为jpeg
 * @param progress   上传进度
 * @param success    成功回调
 * @param failure    失败回调
 *
 * @return 上传任务对象，可取消‘-cancel’，暂停’-suspend‘，开始 ’-resume‘
 */
+ (__kindof NSURLSessionTask *)uploadWithURL:(NSString *)URL parameters:(id)parameters images:(NSArray<UIImage *> *)images name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(progressBlock)progress success:(successBlock)success failure:(failureBlock)failure;


/**
 * 文件下载
 *
 * @param URL      请求地址
 * @param fileDir  文件存储路径
 * @param progress 下载进度
 * @param success  成功回调
 * @param failure  失败回调
 *
 * @return 下载任务对象，可取消‘-cancel’，暂停’-suspend‘，开始 ’-resume‘
 */
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL fileDir:(NSString *)fileDir progress:(progressBlock)progress success:(void(^)(NSString *filePath))success failure:(failureBlock)failure;
@end
