//
//  UIImageView+WJ.m
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "UIImageView+WJ.h"
#import <AFNetworking/AFNetworking.h>
#import <YYWebImage/YYWebImage.h>

@implementation UIImageView (WJ)

- (void)wj_setBigImageWithURL:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL placeholderImage:(UIImage *)placeholderImage completed:(void(^)(UIImage *image, NSURL *url))completedBlock {
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    UIImage *oriImage = [[YYImageCache sharedCache] getImageForKey:bigImageURL];
    if (oriImage) { // 有缓存的原图
        self.image = oriImage;
        if (completedBlock) {
            completedBlock(oriImage, [NSURL URLWithString:bigImageURL]);
        }
    } else { // 没有缓存的原图
        if (mgr.isReachableViaWiFi) { // WIFI网路下
            [self yy_setImageWithURL:[NSURL URLWithString:bigImageURL] placeholder:placeholderImage options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation  completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                if (completedBlock) {
                    completedBlock(image, url);
                }
            }];
        } else if (mgr.isReachableViaWWAN) { // 用户设置了 3G/4G也允许加载大图的情况下 需要从NSUserDefaults 里取
            BOOL downloadOriginalImageWhen3Gor4G = YES;
            if (downloadOriginalImageWhen3Gor4G) {
                [self yy_setImageWithURL:[NSURL URLWithString:bigImageURL] placeholder:placeholderImage options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                    if (completedBlock) {
                        completedBlock(image, url);
                    }
                }];
            } else { // 没有缓存
                [self yy_setImageWithURL:[NSURL URLWithString:smallImageURL] placeholder:placeholderImage options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                    if (completedBlock) {
                        completedBlock(image, url);
                    }
                }];
            }
        } else { // 没有可用网络
            UIImage *thumbImage = [[YYImageCache sharedCache] getImageForKey:smallImageURL];
            if (thumbImage) { // 有缩略图
                self.image = thumbImage;
                if (completedBlock) {
                    completedBlock(thumbImage, [NSURL URLWithString:smallImageURL]);
                }
            } else { // 没有缩略图
                self.image = placeholderImage;
                if (completedBlock) {
                    completedBlock(placeholderImage,nil);
                }
            }
        }
    }
}

- (void)wj_setBigImageWithURL:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL placeholderImage:(UIImage *)placeholderImage {
    [self wj_setBigImageWithURL:bigImageURL smallImage:smallImageURL placeholderImage:placeholderImage completed:nil];
}

- (void)wj_setBigImage:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL completed:(void(^)(UIImage *image, NSURL *url))completedBlock {
    [self wj_setBigImageWithURL:bigImageURL smallImage:smallImageURL placeholderImage:nil completed:completedBlock];
}

- (void)wj_setImageWithURL:(NSString *)imageURL placeholderImage:(UIImage *)placeholderImage completed:(void(^)(UIImage *image, NSURL *url))completedBlock {
    [self wj_setBigImageWithURL:imageURL smallImage:nil placeholderImage:placeholderImage completed:completedBlock];
}

- (void)wj_setImageWithURL:(NSString *)imageURL placeholderImage:(UIImage *)placeholderImage {
    [self wj_setImageWithURL:imageURL placeholderImage:placeholderImage completed:nil];
}

- (void)wj_setImageWithURL:(NSString *)imageURL completed:(void (^)(UIImage *, NSURL *))completedBlock {
    [self wj_setImageWithURL:imageURL placeholderImage:nil completed:completedBlock];
}

@end
