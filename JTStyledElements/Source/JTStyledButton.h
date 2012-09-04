//
//  JTStyledButton.h
//  Jeetrium
//
//  Created by user on 18.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIColor+AdvancedColors.h"

typedef enum
{
    JTButtonGradientType=0,
} JTButtonType;





@interface JTStyledButton : UIButton
{
    UIColor         *_highColor;
    UIColor         *_lowColor;
    UIColor         *_highlightedHighColor;
    UIColor         *_highlightedLowColor;
    UIColor         *_selectedHighColor;
    UIColor         *_selectedLowColor;
    CAGradientLayer *_gradientLayer;
@private    
    JTButtonType    _buttonType;
}

@property (nonatomic, strong) UIColor           *highColor;
@property (nonatomic, strong) UIColor           *lowColor;
@property (nonatomic, strong) UIColor           *highlightedHighColor;
@property (nonatomic, strong) UIColor           *highlightedLowColor;
@property (nonatomic, strong) UIColor           *selectedHighColor;
@property (nonatomic, strong) UIColor           *selectedLowColor;
@property (nonatomic, strong) CAGradientLayer   *gradientLayer;

+(id)gradientButton;
+(id)roundRectLightGradientButton;
+(id)roundRectDarkGradientButton;

@end
