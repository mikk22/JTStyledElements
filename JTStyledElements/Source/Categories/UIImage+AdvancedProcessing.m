//
//  UIImage+AdvancedProcessing.m
//  ButtonsBar
//
//  Created by user on 18.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "UIImage+AdvancedProcessing.h"

@implementation UIImage (AdvancedProcessing)

- (UIImage *)tintedImageUsingColor:(UIColor *)tintColor {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, self.scale);
    CGRect drawRect = CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:drawRect];
    [tintColor set];
    UIRectFillUsingBlendMode(drawRect, kCGBlendModeSourceAtop);
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}



- (UIImage *)tintedWithLinearGradientColors:(NSArray *)colorsArr
{
    return [self tintedWithLinearGradientColors:colorsArr Alpha:1.f];
}




- (UIImage *)tintedWithLinearGradientColors:(NSArray *)colorsArr Alpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    

//    CGContextSaveGState(context);
//    CGContextSetShadow(context, CGSizeMake(0.f, 13.f), 2.f);
    
//    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
//    CGContextClipToMask(context, rect, image.CGImage);
    
    
//    CGContextRestoreGState(context);
    
    
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextDrawImage(context, rect, self.CGImage);
    
    // Create gradient
    
    UIColor *colorOne = [colorsArr objectAtIndex:1]; // top color
    UIColor *colorTwo = [colorsArr objectAtIndex:0]; // bottom color
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil];
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, NULL);
    
    // Apply gradient
    
    CGContextClipToMask(context, rect, self.CGImage);

    CGContextSetAlpha(context, alpha);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,self.size.height), 0);
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(space);
    
    return gradientImage;
}



- (UIImage *)shadowedWithSize:(CGSize)shadowSize Blur:(CGFloat)blur
{
    //    CGContextSaveGState(context);
    //    CGContextSetShadow(context, CGSizeMake(0.f, 13.f), 2.f);
    
    //    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
    //    CGContextClipToMask(context, rect, image.CGImage);
    
    
    //    CGContextRestoreGState(context);
    
    
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetShadow(context, shadowSize, blur);
    CGRect rect = CGRectMake(0, 0, self.size.width+2, self.size.height+2);
    CGContextDrawImage(context, rect, self.CGImage);
    
    
    UIImage *shadowedImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return shadowedImage;
}




- (UIImage *)convertImageToGrayScale
{
    /*
    UIImage *image=self;
    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    // Grayscale color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    // Create bitmap content with current image size and grayscale colorspace
    CGContextRef context = CGBitmapContextCreate(nil, image.size.width, image.size.height, 8, 0, colorSpace, kCGImageAlphaNone);
    
    // Draw image into current context, with specified rectangle
    // using previously defined context (with grayscale colorspace)
    CGContextDrawImage(context, imageRect, [image CGImage]);
    
    // Create bitmap image info from pixel data in current context
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    // Create a new UIImage object  
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    
    // Release colorspace, context and bitmap information
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    
    // Return the new grayscale image
    return newImage;
    */
    return [self desaturate:1.f];
}


-(UIImage*)desaturate:(CGFloat)desaturate
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    //CGRect rect = CGRectMake(0, 0, self.size.width * scale, self.size.height * scale);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextDrawImage(context, rect, self.CGImage);
    CGContextSetBlendMode(context, kCGBlendModeSaturation);
    CGContextClipToMask(context, rect, self.CGImage); // restricts drawing to within alpha channel
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, desaturate);
    CGContextFillRect(context, rect);
    
    CGContextRestoreGState(context); // restore state to reset blend mode
    
    
    UIImage *desaturateImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return desaturateImage;
    
    
}

@end
