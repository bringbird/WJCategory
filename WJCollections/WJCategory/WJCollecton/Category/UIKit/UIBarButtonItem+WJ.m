//
//  UIBarButtonItem+WJ.m
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "UIBarButtonItem+WJ.h"

@implementation UIBarButtonItem (WJ)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents: UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    UIView *view = [[UIView alloc]initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:view];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:target action:action forControlEvents: UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [btn sizeToFit];
    UIView *view = [[UIView alloc]initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:view];
}

+ (UIBarButtonItem *)backItemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:target action:action forControlEvents: UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
