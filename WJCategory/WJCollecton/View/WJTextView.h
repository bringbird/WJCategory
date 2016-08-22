//
//  WJTextView.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJTextView : UITextView

/// 占位文字
@property (nonatomic, copy) NSString *placeholder;

/// 占位文字的颜色 默认是灰色 可自定义设置
@property (nonatomic, strong) UIColor *placeholderColor;

@end
