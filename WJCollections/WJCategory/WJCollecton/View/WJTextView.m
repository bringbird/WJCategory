//
//  WJTextView.m
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "WJTextView.h"

@implementation WJTextView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addobser];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addobser];
    }
    return self;
}

- (void)addobser {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textDidChange {
    [self setNeedsDisplay];
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placehoderColor {
    
    _placeholderColor = placehoderColor;
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    
    [super setFont:font];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if ([self hasText]) return;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    [self.placeholder drawInRect:CGRectMake(6, 8, rect.size.width - 10, rect.size.height - 16) withAttributes:attrs];
}


@end
