//
//  JTMetroView.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/24/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledView.h"
#import "AdvancedGraphics.h"

@implementation JTStyledView

@synthesize metroStyleColors=_metroStyleColors;


-(void)dealloc
{
    self.metroStyleColors=nil;
}

+(id)darkGradientView
{
    JTStyledView *view=[[JTStyledView alloc] initWithFrame:CGRectZero];
    view.metroStyleColors=METRO_DARK_GRADIENT_COLORS;
    return view;
}

+(id)lightGradientView
{
    JTStyledView *view=[[JTStyledView alloc] initWithFrame:CGRectZero];
    view.metroStyleColors=METRO_LIGHT_GRADIENT_COLORS;
    return view;
}

- (void) drawRect:(CGRect)rect
{
    drawGradientWithColors(self.metroStyleColors,self.bounds);
}

-(void)setMetroStyleColors:(NSArray *)metroStyleColors
{
    _metroStyleColors=metroStyleColors;
    [self setNeedsDisplay];
}


@end
