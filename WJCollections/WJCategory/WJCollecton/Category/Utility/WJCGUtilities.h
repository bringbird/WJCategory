//
//  WJCGUtilities.h
//  WJCategory
//
//  Created by 韦明杰 on 2016/12/24.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
//#import "WJConst.h"

NS_ASSUME_NONNULL_BEGIN

/// Create an `ARGB` Bitmap context. Returns NULL if an error occurs.
///
/// @discussion The function is same as UIGraphicsBeginImageContextWithOptions(),
/// but it doesn't push the context to UIGraphic, so you can retain the context for reuse.
CGContextRef _Nullable WJCGContextCreateARGBBitmapContext(CGSize size, BOOL opaque, CGFloat scale);

/// Create a `DeviceGray` Bitmap context. Returns NULL if an error occurs.
CGContextRef _Nullable WJCGContextCreateGrayBitmapContext(CGSize size, CGFloat scale);



/// Get main screen's scale.
CGFloat WJScreenScale();

/// Get main screen's size. Height is always larger than width.
CGSize WJScreenSize();



/// Convert degrees to radians.
CGFloat DegreesToRadians(CGFloat degrees);

/// Convert radians to degrees.
CGFloat RadiansToDegrees(CGFloat radians);



/// Get the transform rotation.
/// @return the rotation in radians [-PI,PI] ([-180°,180°])
CGFloat CGAffineTransformGetRotation(CGAffineTransform transform);

/// Get the transform's scale.x
CGFloat CGAffineTransformGetScaleX(CGAffineTransform transform);

/// Get the transform's scale.y
CGFloat CGAffineTransformGetScaleY(CGAffineTransform transform);

/// Get the transform's translate.x
CGFloat CGAffineTransformGetTranslateX(CGAffineTransform transform);

/// Get the transform's translate.y
CGFloat CGAffineTransformGetTranslateY(CGAffineTransform transform);

/**
 If you have 3 pair of points transformed by a same CGAffineTransform:
 p1 (transform->) q1
 p2 (transform->) q2
 p3 (transform->) q3
 This method returns the original transform matrix from these 3 pair of points.
 
 @see http://stackoverflow.com/questions/13291796/calculate-values-for-a-cgaffinetransform-from-three-points-in-each-of-two-uiview
 */
CGAffineTransform WJCGAffineTransformGetFromPoints(CGPoint before[3], CGPoint after[3]);

/// Get the transform which can converts a point from the coordinate system of a given view to another.
CGAffineTransform WJCGAffineTransformGetFromViews(UIView *from, UIView *to);

/// Create a skew transform.
CGAffineTransform CGAffineTransformMakeSkew(CGFloat x, CGFloat y);

/// Negates/inverts a UIEdgeInsets.
UIEdgeInsets UIEdgeInsetsInvert(UIEdgeInsets insets);

/// Convert CALayer's gravity string to UIViewContentMode.
UIViewContentMode WJCAGravityToUIViewContentMode(NSString *gravity);

/// Convert UIViewContentMode to CALayer's gravity string.
NSString *WJUIViewContentModeToCAGravity(UIViewContentMode contentMode);



/**
 Returns a rectangle to fit the @param rect with specified content mode.
 
 @param rect The constrant rect
 @param size The content size
 @param mode The content mode
 @return A rectangle for the given content mode.
 @discussion UIViewContentModeRedraw is same as UIViewContentModeScaleToFill.
 */
CGRect WJCGRectFitWithContentMode(CGRect rect, CGSize size, UIViewContentMode mode);

/// Returns the center for the rectangle.
CGPoint CGRectGetCenter(CGRect rect);

/// Returns the area of the rectangle.
CGFloat CGRectGetArea(CGRect rect);

/// Returns the distance between two points.
CGFloat CGPointGetDistanceToPoint(CGPoint p1, CGPoint p2);

/// Returns the minmium distance between a point to a rectangle.
CGFloat CGPointGetDistanceToRect(CGPoint p, CGRect r);



/// Convert point to pixel.
CGFloat CGFloatToPixel(CGFloat value);

/// Convert pixel to point.
CGFloat CGFloatFromPixel(CGFloat value);



/// floor point value for pixel-aligned
CGFloat CGFloatPixelFloor(CGFloat value);

/// round point value for pixel-aligned
CGFloat CGFloatPixelRound(CGFloat value);

/// ceil point value for pixel-aligned
CGFloat CGFloatPixelCeil(CGFloat value);

/// round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)
CGFloat CGFloatPixelHalf(CGFloat value);



/// floor point value for pixel-aligned
CGPoint CGPointPixelFloor(CGPoint point);

/// round point value for pixel-aligned
CGPoint CGPointPixelRound(CGPoint point);

/// ceil point value for pixel-aligned
CGPoint CGPointPixelCeil(CGPoint point);

/// round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)
CGPoint CGPointPixelHalf(CGPoint point);



/// floor point value for pixel-aligned
CGSize CGSizePixelFloor(CGSize size);

/// round point value for pixel-aligned
CGSize CGSizePixelRound(CGSize size);

/// ceil point value for pixel-aligned
CGSize CGSizePixelCeil(CGSize size);

/// round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)
CGSize CGSizePixelHalf(CGSize size);



/// floor point value for pixel-aligned
CGRect CGRectPixelFloor(CGRect rect);

/// round point value for pixel-aligned
CGRect CGRectPixelRound(CGRect rect);

/// ceil point value for pixel-aligned
CGRect CGRectPixelCeil(CGRect rect);

/// round point value to .5 pixel for path stroke (odd pixel line width pixel-aligned)
CGRect CGRectPixelHalf(CGRect rect);



/// floor UIEdgeInset for pixel-aligned
UIEdgeInsets UIEdgeInsetPixelFloor(UIEdgeInsets insets);

/// ceil UIEdgeInset for pixel-aligned
UIEdgeInsets UIEdgeInsetPixelCeil(UIEdgeInsets insets);

// main screen's scale
#ifndef kScreenScale
#define kScreenScale WJScreenScale()
#endif

// main screen's size (portrait)
#ifndef kScreenSize
#define kScreenSize WJScreenSize()
#endif

// main screen's width (portrait)
#ifndef kScreenWidth
#define kScreenWidth WJScreenSize().width
#endif

// main screen's height (portrait)
#ifndef kScreenHeight
#define kScreenHeight WJScreenSize().height
#endif

NS_ASSUME_NONNULL_END

