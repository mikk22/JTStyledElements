//
//  JTRoundRectButton.h
//  Viewer
//
//  Created by Mihail Koltsov on 6/13/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTRoundRectButton : UIControl
{
    UIColor         *_fillColor;
    UIColor         *_selectedFillColor;
    UIColor         *_borderColor;
    UIColor         *_selectedBorderColor;
    UILabel         *_textLabel;
    UIImageView     *_imageView;
}

@property (nonatomic, strong)   UIColor         *fillColor;
@property (nonatomic, strong)   UIColor         *selectedFillColor;
@property (nonatomic, strong)   UIColor         *borderColor;
@property (nonatomic, strong)   UIColor         *selectedBorderColor;

@property (nonatomic, strong)   UILabel         *textLabel;
@property (nonatomic, strong)   UIImageView     *imageView;
@property (nonatomic, strong)   NSString        *pictureName;

+(id)rejeetButton;
+(id)recommendButton;
+(id)isLikedButton;
+(id)noLikeButton;
+(id)commentButton;

+(id)borderedButton;
+(id)noBorderButton;
+(id)arrowUpButton;


@end
