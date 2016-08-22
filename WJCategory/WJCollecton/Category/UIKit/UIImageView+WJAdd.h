//
//  UIImageView+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WJAdd)

- (void)wj_setBigImageWithURL:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL placeholderImage:(UIImage *)placeholderImage completed:(void(^)(UIImage *image, NSURL *url))completedBlock;

- (void)wj_setBigImageWithURL:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL placeholderImage:(UIImage *)placeholderImage;

- (void)wj_setBigImage:(NSString *)bigImageURL smallImage:(NSString *)smallImageURL completed:(void(^)(UIImage *image, NSURL *url))completedBlock;

- (void)wj_setImageWithURL:(NSString *)imageURL placeholderImage:(UIImage *)placeholderImage completed:(void(^)(UIImage *image, NSURL *url))completedBlock;

- (void)wj_setImageWithURL:(NSString *)imageURL placeholderImage:(UIImage *)placeholderImage;

- (void)wj_setImageWithURL:(NSString *)imageURL completed:(void(^)(UIImage *image, NSURL *url))completedBlock;
@end
