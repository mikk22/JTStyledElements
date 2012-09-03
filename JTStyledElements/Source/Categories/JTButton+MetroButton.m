//
//  JTButton+MetroButton.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 6/18/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTButton+MetroButton.h"

@implementation JTStyledButton (MetroButton)



+(id)metroButton
{
    JTStyledButton *button=[JTStyledButton buttonWithType:UIButtonTypeCustom];
    if (button)
    {
        button.gradientLayer = [CAGradientLayer layer];
        button.gradientLayer.frame = button.bounds;
        
        button.lowColor=METRO_DARK_START_COLOR;
        button.highColor=METRO_DARK_END_COLOR;
        button.highlightedLowColor=METRO_LIGHT_START_COLOR;
        button.highlightedHighColor=METRO_LIGHT_END_COLOR;
        button.selectedLowColor=METRO_LIGHT_START_COLOR;
        button.selectedHighColor=METRO_LIGHT_END_COLOR;
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];        
        
        [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        //        button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        button.titleLabel.font=METRO_DEFAULT_FONT;
        
        
        button.gradientLayer.colors = [NSArray arrayWithObjects:(id)[button.lowColor CGColor], (id)[button.highColor CGColor], nil];
        
        
        button.layer.cornerRadius = 0.0f;
        button.layer.masksToBounds = YES;
        
        [button.layer insertSublayer:button.gradientLayer atIndex:0];  
        [button bringSubviewToFront:button.imageView];
    }
    
    return button;
}



+(id)inversedMetroButton
{
    JTStyledButton *button=[JTStyledButton buttonWithType:UIButtonTypeCustom];
    if (button)
    {
        button.gradientLayer = [CAGradientLayer layer];
        button.gradientLayer.frame = button.bounds;
        
        button.lowColor=METRO_LIGHT_START_COLOR;
        button.highColor=METRO_LIGHT_END_COLOR;
        button.highlightedLowColor=METRO_DARK_START_COLOR;
        button.highlightedHighColor=METRO_DARK_END_COLOR;
        button.selectedLowColor=METRO_DARK_START_COLOR ;
        button.selectedHighColor=METRO_DARK_END_COLOR;
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];        
        
        [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        //        button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        button.titleLabel.font=METRO_DEFAULT_FONT;
        
        button.gradientLayer.colors = [NSArray arrayWithObjects:(id)[button.lowColor CGColor], (id)[button.highColor CGColor], nil];
        
        button.layer.cornerRadius = 0.0f;
        button.layer.masksToBounds = YES;
        
        [button.layer insertSublayer:button.gradientLayer atIndex:0];  
        [button bringSubviewToFront:button.imageView];
    }
    
    return button;
}



@end
