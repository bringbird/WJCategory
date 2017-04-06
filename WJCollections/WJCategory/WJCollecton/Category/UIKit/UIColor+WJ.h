//
//  UIColor+WJ.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
extern void RGB2HSL(CGFloat r, CGFloat g, CGFloat b,
                    CGFloat *h, CGFloat *s, CGFloat *l);

extern void HSL2RGB(CGFloat h, CGFloat s, CGFloat l,
                    CGFloat *r, CGFloat *g, CGFloat *b);

extern void RGB2HSB(CGFloat r, CGFloat g, CGFloat b,
                    CGFloat *h, CGFloat *s, CGFloat *v);

extern void HSB2RGB(CGFloat h, CGFloat s, CGFloat v,
                    CGFloat *r, CGFloat *g, CGFloat *b);

extern void RGB2CMYK(CGFloat r, CGFloat g, CGFloat b,
                     CGFloat *c, CGFloat *m, CGFloat *y, CGFloat *k);

extern void CMYK2RGB(CGFloat c, CGFloat m, CGFloat y, CGFloat k,
                     CGFloat *r, CGFloat *g, CGFloat *b);

extern void HSB2HSL(CGFloat h, CGFloat s, CGFloat b,
                    CGFloat *hh, CGFloat *ss, CGFloat *ll);

extern void HSL2HSB(CGFloat h, CGFloat s, CGFloat l,
                    CGFloat *hh, CGFloat *ss, CGFloat *bb);

/*
 通过 hex string 创建 UIColor 对象
 例: UIColorHex(0xF0F), UIColorHex(66ccff), UIColorHex(#66CCFF88)
 
 可以是 #RGB #RGBA #RRGGBB #RRGGBBAA 0xRGB 格式
 可不用 `#` 或 "0x" 等标识符
 */
#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

/*
 此分类里的所有值均为‘float’类型（0.0 ~ 1.0）。
 小于’0.0‘的将会转化为’0.0‘以及大于‘1.0的也将会转化为’1.0‘。
 */
@interface UIColor (WJ)

/// 随机色
+ (UIColor *)randomColor;

/// 创建 HSL 色彩模式的 UIColor 对象，
/// hue：色调，saturation：饱和度，
/// lightness：亮度，alpha：透明度（`0.0` ~ `1.0`）
+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;


/// 创建 CMYK 色彩模式的 UIColor 对象，
/// cyan：青色，magenta：品红色，yellow：黄色，
/// black：黑色，alpha：透明度。（‘0.0 ~ 1.0）
+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;


/// 通过 hex 值创建 RGB 色彩模式的 UIColor 对象，
/// rgbValue：‘0x66ccff’ 形式的写法。
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;


/// 通过 hex 值创建 RGBA 色彩模式的 UIColor 对象，
/// rgbValue：‘0x66ccffff’ 形式的写法。
+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue;


/// 通过 hex 值创建 RGBA 色彩模式的 UIColor 对象，
/// rgbValue：‘0x66ccffff’ 形式的写法，
/// alpha：不透明度（’0.0 ~ 1.0‘）
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;


/// 通过 hex string 创建 UIColor 对象，
/// hex string 可为 #RGB 、#RGBA 、#RRGGBB 、#RRGGBBAA 、0xRGB 等格式，
/// 如果没有 alpha值，alpha 将会默认设置为 1.0，
/// 例：@"0xF0F" 、@"66ccff" 、@"#66CCFF88"
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;


/// 混合两种颜色，add：需要混合的颜色，blendmode：混合模式
- (UIColor *)colorByAddColor:(UIColor *)add blendMode:(CGBlendMode)blendMode;


/// 将指定颜色进行转换，
/// hueDelta：色调， saturationDelta：饱和度， brightnessDelta：亮度，
/// alphDelta：透明度。(‘-1.0’ ~ ‘1.0’，0 意味着不做转换)
- (UIColor *)colorByChangeHue:(CGFloat)hueDelta saturation:(CGFloat)saturationDelta brightness:(CGFloat)brightnessDelta alpha:(CGFloat)alphaDelta;

/// 指定颜色的 hex 值(RGB类型，例：@"0066ccff")
- (uint32_t)rgbValue;

/// 指定颜色的 hex 值(RGB类型，例：@"0066ccffff")
- (uint32_t)rgbaValue;

/// 指定颜色的 hex string(小写字母，例：@"0066cc")
/// 如果不是 RGB 类型将会为 nil
- (nullable NSString *)hexString;

/// 指定颜色的 hex string(小写字母，例：@"0066ccff")
/// 如果不是 RGBA 类型将会为 nil
- (nullable NSString *)hexStringWithAlpha;

/// 指定的 UIColor 对象是否可以被转换成 HSL 色彩模式
/// hue：色调，saturation：饱和度，
/// lightness：亮度，alpha：透明度（`0.0` ~ `1.0`）
- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation lightness:(CGFloat *)lightness alpha:(CGFloat *)alpha;


/// 指定的 UIColor 对象是否可转换成 CMYK 颜色。
/// cyan：青色，magenta：品红色，yellow：黄色，
/// black：黑色，alpha：透明度。（‘0.0 ~ 1.0）
- (BOOL)getCyan:(CGFloat *)cyan magenta:(CGFloat *)magenta yellow:(CGFloat *)yellow black:(CGFloat *)black alpha:(CGFloat *)alpha;

/// 红色值 `0.0` ~ `1.0`
@property (nonatomic, readonly) CGFloat red;

/// 绿色值 `0.0` ~ `1.0`
@property (nonatomic, readonly) CGFloat green;

/// 蓝色值 `0.0` ~ `1.0`
@property (nonatomic, readonly) CGFloat blue;

/// 颜色的色调 `0.0` ~ `1.0`
@property (nonatomic, readonly) CGFloat hue;

/// 颜色的饱和度 `0.0` ~ `1.0`
@property (nonatomic, readonly) CGFloat saturation;

/// 颜色的亮度 `0.0` ~ `1.0`
@property (nonatomic, readonly) CGFloat brightness;

/// 颜色的透明度 `0.0` ~ `1.0`
@property (nonatomic, readonly) CGFloat alpha;

/// 色彩样式
@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;

/// 色彩空间字的符串
@property (nullable, nonatomic, readonly) NSString *colorSpaceString;

@end
NS_ASSUME_NONNULL_END
