//
//  WJImagePicker.h
//  WJCategory
//
//  Created by bringbird on 16/10/23.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ImagePickerType) {
    ImagePickerCamera = 0,
    ImagePickerPhoto = 1
};

@class WJImagePicker;

@protocol WJImagePickerDelegate <NSObject>

@required
- (void)imagePicker:(WJImagePicker *)imagePicker didFinished:(UIImage *)editedImage;

@optional
- (void)imagePickerDidCancel:(WJImagePicker *)imagePicker;

@end

@interface WJImagePicker : NSObject

+ (instancetype)sharedInstance;

/// scale 裁剪框的高宽比 0~1.5 默认为1
- (void)showImagePickerWithType:(ImagePickerType)type inViewController:(UIViewController *)viewController Scale:(double)scale;

/// 代理
@property (nonatomic, assign) id<WJImagePickerDelegate> delegate;

@end
