//
//  UIImage+AdvancedProcessing.h
//  ButtonsBar
//
//  Created by user on 18.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>

#define     SELECTED_IMAGE_TINT_COLOR  [UIColor colorWithRed:41.0/255.0 green:147.0/255.0 blue:239.0/255.0 alpha:1.0]

@interface UIImage (AdvancedProcessing)

- (UIImage *)tintedImageUsingColor:(UIColor *)tintColor;
- (UIImage *)tintedWithLinearGradientColors:(NSArray *)colorsArr;
- (UIImage *)tintedWithLinearGradientColors:(NSArray *)colorsArr Alpha:(CGFloat)alpha;
- (UIImage *)shadowedWithSize:(CGSize)shadowSize Blur:(CGFloat)blur;

- (UIImage *)convertImageToGrayScale;
- (UIImage*)desaturate:(CGFloat)desaturate;

@end
