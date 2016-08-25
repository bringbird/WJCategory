//
//  UIImage+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIImage (WJAdd)

/// 加载原图,防止渲染
+ (instancetype)originalImageWithName:(NSString *)imageName;

/// 将图片裁剪成圆形
- (instancetype)circleImage;

/// 高斯模糊图片
+ (instancetype)blurImage:(UIImage *)image blur:(CGFloat)blur;

/// 将指定的 GIF 图片数据 创建成 UIimage 对象，如果不是 GIF 图片数据，此方法同 ‘[UIImage imageWithData:data scale:scale]’，
/// data：GIF 图片数据，scale：比例系数。
/// 适用于较小的 GIF 图片
+ (nullable UIImage *)imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;

/// 指定的图片数据是否是 GIF 图片，data：图片数据
+ (BOOL)isAnimatedGIFData:(NSData *)data;

/// 指定的图片文件是否是 GIF 图片，path：图片的路径。
+ (BOOL)isAnimatedGIFFile:(NSString *)path;

/// 将指定的 PDF 文件数据或文件路径 创建成 UIImage对象，如果是多页的 PDF 文件，仅返回第一页，图片 scale 等同于设备的 scale，size等同于 PDF 的 size，dataOrPath：‘NSData’形式的 PDF 数据 或 ‘NSString’形式的路径。
+ (nullable UIImage *)imageWithPDF:(id)dataOrPath;


/// 将指定的 PDF 文件数据或文件路径 创建成 UIImage 对象，如果是多页的 PDF 文件，仅返回第一页，图片 scale 等同于设备的 scale，dataOrPath：‘NSData’形式的 PDF 数据 或 ‘NSString’形式的路径，size：’UIImage‘对象的 size，PDF 的内容将会适当的拉伸。
+ (nullable UIImage *)imageWithPDF:(id)dataOrPath size:(CGSize)size;

/// 创建正方形的 emoji 图片对象，图片 scale 等同于设备的 scale，字体大小为 120*120 像素，emoji：单个emoji表情，size：图片 size
+ (nullable UIImage *)imageWithEmoji:(NSString *)emoji size:(CGFloat)size;

/// 将指定的 UIColor 对象 创建成 1x1 大小的图片。
+ (nullable UIImage *)imageWithColor:(UIColor *)color;

/// 将指定的 UIColor 对象创建成纯色的图片，size：图片的size。
+ (nullable UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/// 自定义绘制图片，size：图片的size，block：绘制回调。
+ (nullable UIImage *)imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock;

/// 是否含有透明通道
- (BOOL)hasAlphaChannel;

/// 自定义绘制图片，contentMode：绘制模式，clips：是否裁剪实适应指定的 Rect。
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips;

/// 将图片拉伸至指定尺寸
- (nullable UIImage *)imageByResizeToSize:(CGSize)size;

/// 将图片按指定的模式拉伸至指定的尺寸
- (nullable UIImage *)imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

/// 将图片裁剪至指定的尺寸
- (nullable UIImage *)imageByCropToRect:(CGRect)rect;

/**
 Returns a new image which is edge inset from this image.
 
 @param insets  Inset (positive) for each of the edges, values can be negative to 'outset'.
 
 @param color   Extend edge's fill color, nil means clear color.
 
 @return        The new image, or nil if an error occurs.
 */
- (nullable UIImage *)imageByInsetEdge:(UIEdgeInsets)insets withColor:(nullable UIColor *)color;

/// 将指定的图片设置成圆角图片，当圆角半径超过图片宽或高的二分之一，将会适当的降为图片宽或高的二分之一。
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

/// 将指定的图片设置成圆角图片，radius：圆角半径（当半径超过图片宽或高的二分之一，将会适当的降为图片宽/高的二分之一）borderWidth：边框宽度（边框宽度的大小与圆角半径的大小限制相同），borderColor：边框颜色
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;

/**
 Rounds a new image with a given corner size.
 
 @param radius       The radius of each corner oval. Values larger than half the
 rectangle's width or height are clamped appropriately to
 half the width or height.
 
 @param corners      A bitmask value that identifies the corners that you want
 rounded. You can use this parameter to round only a subset
 of the corners of the rectangle.
 
 @param borderWidth  The inset border line width. Values larger than half the rectangle's
 width or height are clamped appropriately to half the width
 or height.
 
 @param borderColor  The border stroke color. nil means clear color.
 
 @param borderLineJoin The border line join.
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius corners:(UIRectCorner)corners borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor borderLineJoin:(CGLineJoin)borderLineJoin;

/// 将指定的图片绕中心旋转，radians：逆时针旋转角度⟲，fitSize：是否自适应，YES：图片的尺寸将会适当的拉伸，NO：图片的尺寸不会改变，担可能会被裁剪
- (nullable UIImage *)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;

/// 逆时针旋转 90° ⤺， 宽、高将会互换。
- (nullable UIImage *)imageByRotateLeft90;

/// 顺时针旋转 90° ⤼， 宽、高将会互换。
- (nullable UIImage *)imageByRotateRight90;

/// 旋转180°. ↻
- (nullable UIImage *)imageByRotate180;

/// 垂直翻转 ⥯
- (nullable UIImage *)imageByFlipVertical;

/// 水平翻转 ⇋
- (nullable UIImage *)imageByFlipHorizontal;

/**
 Tint the image in alpha channel with the given color.
 
 @param color  The color.
 */
- (nullable UIImage *)imageByTintColor:(UIColor *)color;

/**
 Returns a grayscaled image.
 */
- (nullable UIImage *)imageByGrayscale;

/**
 Applies a blur effect to this image. Suitable for blur any content.
 */
- (nullable UIImage *)imageByBlurSoft;

/**
 Applies a blur effect to this image. Suitable for blur any content except pure white.
 (same as iOS Control Panel)
 */
- (nullable UIImage *)imageByBlurLight;

/**
 Applies a blur effect to this image. Suitable for displaying black text.
 (same as iOS Navigation Bar White)
 */
- (nullable UIImage *)imageByBlurExtraLight;

/**
 Applies a blur effect to this image. Suitable for displaying white text.
 (same as iOS Notification Center)
 */
- (nullable UIImage *)imageByBlurDark;

/**
 Applies a blur and tint color to this image.
 
 @param tintColor  The tint color.
 */
- (nullable UIImage *)imageByBlurWithTint:(UIColor *)tintColor;

/**
 Applies a blur, tint color, and saturation adjustment to this image,
 optionally within the area specified by @a maskImage.
 
 @param blurRadius     The radius of the blur in points, 0 means no blur effect.
 
 @param tintColor      An optional UIColor object that is uniformly blended with
 the result of the blur and saturation operations. The
 alpha channel of this color determines how strong the
 tint is. nil means no tint.
 
 @param tintBlendMode  The @a tintColor blend mode. Default is kCGBlendModeNormal (0).
 
 @param saturation     A value of 1.0 produces no change in the resulting image.
 Values less than 1.0 will desaturation the resulting image
 while values greater than 1.0 will have the opposite effect.
 0 means gray scale.
 
 @param maskImage      If specified, @a inputImage is only modified in the area(s)
 defined by this mask.  This must be an image mask or it
 must meet the requirements of the mask parameter of
 CGContextClipToMask.
 
 @return               image with effect, or nil if an error occurs (e.g. no
 enough memory).
 */
- (nullable UIImage *)imageByBlurRadius:(CGFloat)blurRadius tintColor:(nullable UIColor *)tintColor tintMode:(CGBlendMode)tintBlendMode saturation:(CGFloat)saturation maskImage:(nullable UIImage *)maskImage;

@end

NS_ASSUME_NONNULL_END
