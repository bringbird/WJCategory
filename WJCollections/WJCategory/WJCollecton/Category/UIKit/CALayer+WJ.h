//
//  CALayer+WJ.h
//  WJCategory
//
//  Created by bringbird on 16/8/22.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
NS_ASSUME_NONNULL_BEGIN
@interface CALayer (WJ)

/**
 Take snapshot without transform, image's size equals to bounds.
 */
- (UIImage *)snapshotImage;

/**
 Take snapshot without transform, PDF's page size equals to bounds.
 */
- (NSData *)snapshotPDF;

/**
 Shortcut to set the layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all sublayers.
 */
- (void)removeAllSublayers;

@property (nonatomic) CGFloat left;        ///< frame.origin.x.
@property (nonatomic) CGFloat top;         ///< frame.origin.y
@property (nonatomic) CGFloat right;       ///< frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< frame.size.width.
@property (nonatomic) CGFloat height;      ///< frame.size.height.
@property (nonatomic) CGPoint center;      ///< center.
@property (nonatomic) CGFloat centerX;     ///< center.x
@property (nonatomic) CGFloat centerY;     ///< center.y
@property (nonatomic) CGPoint origin;      ///< frame.origin.
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize  size; ///< frame.size.


@property (nonatomic) CGFloat transformRotation;     ///< tranform.rotation
@property (nonatomic) CGFloat transformRotationX;    ///< tranform.rotation.x
@property (nonatomic) CGFloat transformRotationY;    ///< tranform.rotation.y
@property (nonatomic) CGFloat transformRotationZ;    ///< tranform.rotation.z
@property (nonatomic) CGFloat transformScale;        ///< tranform.scale
@property (nonatomic) CGFloat transformScaleX;       ///< tranform.scale.x
@property (nonatomic) CGFloat transformScaleY;       ///< tranform.scale.y
@property (nonatomic) CGFloat transformScaleZ;       ///< tranform.scale.z
@property (nonatomic) CGFloat transformTranslationX; ///< tranform.translation.x
@property (nonatomic) CGFloat transformTranslationY; ///< tranform.translation.y
@property (nonatomic) CGFloat transformTranslationZ; ///< tranform.translation.z

/**
 Shortcut for transform.m34, -1/1000 is a good value.
 It should be set before other transform shortcut.
 */
@property (nonatomic) CGFloat transformDepth;

/**
 Wrapper for `contentsGravity` property.
 */
@property (nonatomic) UIViewContentMode contentMode;

/**
 Add a fade animation to layer's contents when the contents is changed.
 
 @param duration Animation duration
 @param curve    Animation curve.
 */
- (void)addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;

/**
 Cancel fade animation which is added with "-addFadeAnimationWithDuration:curve:".
 */
- (void)removePreviousFadeAnimation;

@end

NS_ASSUME_NONNULL_END
