//
//  UIImage+JTImages.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "UIImage+JTImages.h"
#import "AdvancedGraphics.h"

@implementation UIImage (JTImages)


+(UIImage*)addPhotoImage
{
    return [self addPhotoImageWithSize:CGSizeMake(78.f, 78.f)];
}

+(UIImage*)addPhotoImageWithSize:(CGSize)size
{
    return [UIImage jtStyledImage:@"JTStyledElementsBundle.bundle/addPhoto.png" WithSize:size];
}

+(UIImage*)noPhotoImage
{
    return [self addPhotoImageWithSize:CGSizeMake(78.f, 78.f)];
}

+(UIImage*)noPhotoImageWithSize:(CGSize)size
{
    return [UIImage jtStyledImage:@"JTStyledElementsBundle.bundle/Photo.png" WithSize:size];
}





+(UIImage*)jtStyledImage:(NSString*)imageName WithSize:(CGSize)size
{
    CGFloat scale=1.f;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        ([UIScreen mainScreen].scale == 2.0))
    {
        scale=2.f;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    
    drawMetroStyleFillinContext(context, CGRectMake(0, 0, size.width, size.height));
    
    if (imageName)
    {
        UIImage *photoCameraImage=[UIImage imageNamed:imageName];

        NSString *resourceBundlePath = [[NSBundle mainBundle] pathForResource:@"JTStyledElementsBundle" ofType:@"bundle"];
        NSBundle *resourceBundle = [NSBundle bundleWithPath:resourceBundlePath];
        
        NSLog(@"resourceBundlePath %@",resourceBundlePath);
        NSLog(@"resourceBundle %@",resourceBundle);
        
        NSLog(@"PATH %@",imageName);
        NSLog(@"IMAGE %@",photoCameraImage);
        
        CGRect rect = CGRectMake(0.25f*size.width, 0.325f*size.height, 0.5f*size.width, 0.35f*size.height);
        
        CGContextDrawImage(context, rect, photoCameraImage.CGImage);
    }
    
    CGContextRestoreGState(context); // restore state to reset blend mode
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
    
    
}


@end
