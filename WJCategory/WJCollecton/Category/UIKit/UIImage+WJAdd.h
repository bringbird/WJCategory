//
//  UIImage+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WJAdd)

/// 加载原图,防止渲染
+ (instancetype)originalImageWithName:(NSString *)imageName;

/// 将图片裁剪成圆形
- (instancetype)circleImage;

/// 高斯模糊图片
+ (instancetype)blurImage:(UIImage *)image blur:(CGFloat)blur;

@end
