//
//  UIImageView+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WJAdd)

/// 大图 小图 占位图 完成回调
- (void)wj_setBigImageWithURL:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL placeholderImage:(UIImage *)placeholderImage completed:(void(^)(UIImage *image, NSURL *url))completedBlock;

/// 大图 小图 占位图
- (void)wj_setBigImageWithURL:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL placeholderImage:(UIImage *)placeholderImage;

/// 大图 小图 完成回调
- (void)wj_setBigImage:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL completed:(void(^)(UIImage *image, NSURL *url))completedBlock;

/// 图 占位图 完成回调
- (void)wj_setImageWithURL:(NSString *)imageURL placeholderImage:(UIImage *)placeholderImage completed:(void(^)(UIImage *image, NSURL *url))completedBlock;

/// 图 占位图
- (void)wj_setImageWithURL:(NSString *)imageURL placeholderImage:(UIImage *)placeholderImage;

/// 图 完成回调
- (void)wj_setImageWithURL:(NSString *)imageURL completed:(void(^)(UIImage *image, NSURL *url))completedBlock;

@end
