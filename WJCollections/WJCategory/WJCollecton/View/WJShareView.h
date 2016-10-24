//
//  WJShareView.h
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJShareView : UIView

typedef void (^shareHandler)(NSUInteger index);

+ (instancetype)showShareViewWithImages:(NSArray<UIImage *> *)images titles:(NSArray<NSString *> *)titles shareHandler:(shareHandler)handler;

@end
