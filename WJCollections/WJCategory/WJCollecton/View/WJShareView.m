//
//  WJShareView.m
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJShareView.h"
#import "UIView+WJ.h"

@interface WJShareView ()
@property (nonatomic, strong) UIWindow *shareWindow;
@property (nonatomic, assign) CGFloat  maskAlpha;
@property (nonatomic, strong) NSArray  *images;
@property (nonatomic, strong) NSArray  *titles;
@property (nonatomic, assign) BOOL     isShow;
@property (nonatomic,  weak ) UIView   *maskView;
@property (nonatomic,  weak ) UIView   *shareBgView;
@property (nonatomic, copy) void (^shareHandler)(NSUInteger index);
@end

@implementation WJShareView

- (UIWindow *)shareWindow {
    if (!_shareWindow ) {
        self.shareWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.shareWindow.windowLevel = UIWindowLevelStatusBar;
        self.shareWindow.backgroundColor = [UIColor clearColor];
        self.shareWindow.hidden = NO;
    }
    return _shareWindow;
}

+ (instancetype)showShareViewWithImages:(NSArray<UIImage *> *)images titles:(NSArray<NSString *> *)titles shareHandler:(shareHandler)handler {
    return [[self alloc] initWithWJShowShareViewWithImages:images titles:titles handler:handler];
    
}

- (instancetype)initWithWJShowShareViewWithImages:(NSArray<UIImage *> *)images titles:(NSArray<NSString *> *)titles handler:(shareHandler)handler {
    if (self = [super init]) {
        NSAssert(images.count == titles.count && (images || titles != nil),@"images count must be equal to the titles count and Both can't be empty!");
        self.images = images;
        self.titles = titles;
        [self setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [self.shareWindow addSubview:self];
        self.shareHandler = handler;
        [self show];
    }
    return self;
}

- (void)prepareUI {
    [self configMaskView];
}

- (void)configMaskView {
    UIView *maskView = [[UIView alloc] init];
    [maskView setAlpha:0];
    [maskView setUserInteractionEnabled:NO];
    [maskView setFrame:(CGRect){0, 0, [UIScreen mainScreen].bounds.size}];
    _maskAlpha = 0.5;
    [maskView setBackgroundColor:[UIColor blackColor]];
    [self addSubview:maskView];
    self.maskView = maskView;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [maskView addGestureRecognizer:tap];
    [self configSharebutton];
}

- (void)configSharebutton {
    UIView *shareBgView = [[UIView alloc]init];
    shareBgView.left = 0;
    shareBgView.top = self.height;
    shareBgView.width = _shareWindow.width;
    shareBgView.backgroundColor = [UIColor whiteColor];
    
    CGFloat margin = 10;
    CGFloat shareButtonWH = (self.shareWindow.frame.size.width - ((_images.count + 1) * margin)) / _images.count;
    CGFloat shareButtonY = self.images.count > 5 ? margin + (shareButtonWH + (margin * 2)) : margin;
    CGFloat titleLabWidh = (self.shareWindow.frame.size.width) / self.images.count;
    CGFloat titleLabHeight = 20;
    CGFloat titleLabMaxY = 0.0;
    for (int i = 0; i<self.images.count; i++) {
        UIButton *shareButton = [[UIButton alloc]init];
        i = i > 5 ? i - 5 : i;
        [shareButton setImage:self.images[i] forState:UIControlStateNormal];
        shareButton.tag = i;
        shareButton.left = margin + (i * ( margin + shareButtonWH));
        shareButton.top = shareButtonY;
        [shareButton addTarget:self action:@selector(shareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        shareButton.size = CGSizeMake(shareButtonWH, shareButtonWH);
        [shareBgView addSubview:shareButton];
        UILabel *titleLab = [[UILabel alloc]init];
        [titleLab setText:self.titles[i]];
        titleLab.font = [UIFont systemFontOfSize:11];
        [titleLab setTextColor:[UIColor colorWithWhite:0.000 alpha:0.799]];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.width = titleLabWidh;
        titleLab.height = titleLabHeight;
        titleLab.centerX = shareButton.centerX;
        titleLab.bottom = shareButton.bottom - 5;
        [shareBgView addSubview:titleLab];
        titleLabMaxY = titleLab.bottom;
    }
    
    shareBgView.height = titleLabMaxY + margin;
    [self addSubview:shareBgView];
    self.shareBgView = shareBgView;
}

- (void)shareButtonAction:(UIButton *)button {
    if (self.shareHandler) {
        self.shareHandler(button.tag);
    }
    [self dismiss];
}

- (void)show {
    if (self.isShow) {
        return;
    }
    _shareWindow.hidden = NO;
    [self prepareUI];
    [self setFrame:(CGRect){0, 0, [UIScreen mainScreen].bounds.size}];
    [self setNeedsLayout];
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [_maskView setAlpha:0.5];
        [_maskView setUserInteractionEnabled:YES];
        self.shareBgView.bottom -= _shareBgView.height;
    } completion:nil];
    self.isShow = YES;
}

- (void)dismiss {
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.shareBgView.top += _shareBgView.height;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [_maskView setAlpha:0];
            _shareWindow.hidden = YES;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            self.isShow = NO;
        }];
    }];
}
@end
