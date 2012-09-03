//
//  UIImage+MetroImages.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MetroImages)

+(UIImage*)addPhotoImage;
+(UIImage*)noPhotoImage;
+(UIImage*)addPhotoImageWithSize:(CGSize)size;
+(UIImage*)noPhotoImageWithSize:(CGSize)size;
+(UIImage*)metroStyledImage:(NSString*)imageName WithSize:(CGSize)size;



@end
