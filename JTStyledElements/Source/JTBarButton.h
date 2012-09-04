//
//  JTBarButton.h
//  Jeetrium
//
//  Created by user on 16.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIColor+AdvancedColors.h"


typedef enum
{
    JTBarButtonBarType=1,
    JTBarButtonToolbarType=2
} JTBarButtonType;

#define TOOLBAR_BUTTON_IMAGE_WIDTH      25.f
#define TOOLBAR_BUTTON_IMAGE_HEIGHT     25.f




@interface JTBarButton : UIButton
{
//gradient button    
    UIColor             *_highColor;
    UIColor             *_lowColor;
    UIColor             *_highlightedHighColor;
    UIColor             *_highlightedLowColor;
    UIColor             *_selectedHighColor;
    UIColor             *_selectedLowColor;
    CAGradientLayer     *_gradientLayer;
//bar button
    UIColor             *_selectedImageTintColor;
    CGFloat             _textSpacing;
    CGFloat             _selectedAlpha;
@private    
    JTBarButtonType     _buttonType;
  //  BOOL                _init;
}

//gradient button
@property (nonatomic, strong)   UIColor           *highColor;
@property (nonatomic, strong)   UIColor           *lowColor;
@property (nonatomic, strong)   UIColor           *highlightedHighColor;
@property (nonatomic, strong)   UIColor           *highlightedLowColor;
@property (nonatomic, strong)   UIColor           *selectedHighColor;
@property (nonatomic, strong)   UIColor           *selectedLowColor;
@property (nonatomic, strong)   CAGradientLayer   *gradientLayer;
//bar button
@property (nonatomic, strong)   UIColor           *selectedImageTintColor;
@property (nonatomic)           CGFloat           textSpacing;
@property (nonatomic)           CGFloat           selectedAlpha;


//- (void)setHighColor:(UIColor*)color;
//- (void)setLowColor:(UIColor*)color;

+(id)barButton;
+(id)toolbarButton;
//-(void)_setImageToTopTextToBottom;

@end
