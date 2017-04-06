//
//  WJNetworking.m
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJNetworking.h"
#import <AFNetworking.h>
#import "AFNetworkActivityIndicatorManager.h"

@implementation WJNetworking

+ (void)showActivitevie:(BOOL)show {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = show;
}

+ (void)startMonitoringNetwork {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
}

+ (void)checkNetworkStatusWithBlock:(NetworkStatus)status {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus st) {
        switch (st) {
            case AFNetworkReachabilityStatusUnknown: {
                status(WJNetStatusUnknown);
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                status(WJNetStatusNone);
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                status(WJNetStatusWWAN);
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                status(WJNetStatusWiFi);
                break;
            }
        }
    }];
}

+ (void)GET:(NSString *)URL parameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure {
    [self showActivitevie:YES];
    [[self sessionManager] GET:URL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self showActivitevie:NO];
        success?success(responseObject):nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showActivitevie:NO];
        failure?failure(error):nil;
    }];
}

+ (void)POST:(NSString *)URL parameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure {
    [self showActivitevie:YES];
    AFHTTPSessionManager *manager = [self sessionManager];
    [manager POST:URL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self showActivitevie:NO];
        success?success(responseObject):nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showActivitevie:NO];
        failure?failure(error):nil;
    }];
}

+ (NSURLSessionTask *)uploadWithURL:(NSString *)URL parameters:(id)parameters images:(NSArray<UIImage *> *)images name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(progressBlock)progress success:(successBlock)success failure:(failureBlock)failure {
    [self showActivitevie:YES];
    return [[self sessionManager] POST:URL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull image, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            [formData appendPartWithFileData:imageData name:name fileName:[NSString stringWithFormat:@"%@%zd.%@",fileName,idx,mimeType?mimeType:@"jpeg"] mimeType:[NSString stringWithFormat:@"image/%@",mimeType?mimeType:@"jpeg"]];
        }];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress ? progress(uploadProgress) : nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self showActivitevie:NO];
        success?success(responseObject):nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showActivitevie:NO];
        failure?failure(error):nil;
    }];
}

+ (NSURLSessionTask *)downloadWithURL:(NSString *)URL fileDir:(NSString *)fileDir progress:(progressBlock)progress success:(void (^)(NSString *))success failure:(failureBlock)failure {
    [self showActivitevie:YES];
    AFHTTPSessionManager *manager = [self sessionManager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress ? progress(downloadProgress) : nil; 
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 缓存目录
        NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileDir ? fileDir : @"Download"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // 创建Download目录
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        // 文件路径
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        // 返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        [self showActivitevie:NO];
        success ? success(filePath.absoluteString) : nil;
        failure && error ? failure(error) : nil;
    }];
    [downloadTask resume];
    return downloadTask;
}

+ (AFHTTPSessionManager *)sessionManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.f;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    return manager;
}

@end
