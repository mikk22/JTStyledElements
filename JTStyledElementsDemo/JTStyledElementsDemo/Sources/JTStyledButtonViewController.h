//
//  JTStyledButtonViewController.h
//  JTStyledElements
//
//  Created by Mihail Koltsov on 9/4/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTStyledElements.h"

@interface JTStyledButtonViewController : UIViewController
{
    JTStyledButton      *_gradientButton;
    JTStyledButton      *_roundRectLightGradientButton;
    JTStyledButton      *_roundRectDarkGradientButton;
    JTStyledButton      *_jtButton;
    JTStyledButton      *_inversedJTButton;
}

@property (nonatomic, strong)   JTStyledButton      *gradientButton;
@property (nonatomic, strong)   JTStyledButton      *roundRectLightGradientButton;
@property (nonatomic, strong)   JTStyledButton      *roundRectDarkGradientButton;
@property (nonatomic, strong)   JTStyledButton      *jtButton;
@property (nonatomic, strong)   JTStyledButton      *inversedJTButton;


@end
