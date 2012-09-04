//
//  JTMetroTextField.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/24/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledTextField.h"
#import "JTStyledDefines.h"
#import "AdvancedGraphics.h"


@implementation JTStyledTextField

@synthesize metroStyleColors=_metroStyleColors;
@synthesize editingMetroStyleColors=_editingMetroStyleColors;

-(void)dealloc
{
    self.metroStyleColors=nil;
    self.editingMetroStyleColors=nil;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.font=METRO_DEFAULT_FONT;
        self.backgroundColor=[UIColor clearColor];
        self.clearButtonMode=UITextFieldViewModeNever;
        self.textColor=[UIColor whiteColor];
        self.textAlignment=UITextAlignmentCenter;
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
  

        _gradientLayer=[CAGradientLayer layer];
        _gradientLayer.colors=  [NSArray arrayWithObjects:(id)[[self.metroStyleColors objectAtIndex:0] CGColor],
                                                          (id)[[self.metroStyleColors objectAtIndex:1] CGColor], nil];

        [self.layer addSublayer:_gradientLayer];
        
    }
    return self;
}

/*
-(void)animation
{
    //if (!_gradientLayer.animationKeys)
    {
    
    NSLog(@"!!!ANIMATION");
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];

        //animation.fromValue=_gradientLayer.colors;
    
    if ([super isEditing])
    {
//        animation.fromValue=_gradientLayer.colors;
        animation.fromValue = [NSArray arrayWithObjects:(id)[[self.metroStyleColors objectAtIndex:0] CGColor],
                                                        (id)[[self.metroStyleColors objectAtIndex:1] CGColor], nil];
        animation.toValue = [NSArray arrayWithObjects:(id)[[self.editingMetroStyleColors objectAtIndex:0] CGColor],
                                                      (id)[[self.editingMetroStyleColors objectAtIndex:1] CGColor], nil];
    } else 
    {
        animation.fromValue = [NSArray arrayWithObjects:(id)[[self.editingMetroStyleColors objectAtIndex:0] CGColor],
                             (id)[[self.editingMetroStyleColors objectAtIndex:1] CGColor], nil];
        animation.toValue = [NSArray arrayWithObjects:(id)[[self.metroStyleColors objectAtIndex:0] CGColor],
                                                        (id)[[self.metroStyleColors objectAtIndex:1] CGColor], nil];
        //animation.fromValue = self.editingMetroStyleColors;
    }

    animation.duration	= 1.0;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_gradientLayer addAnimation:animation forKey:@"animateGradient"];
    }
}
*/



-(void)layoutSubviews
{
    [super layoutSubviews];
    _gradientLayer.frame=self.bounds;
}

/*
-(void)drawRect:(CGRect)rect
{
    NSArray *metroStyleColors;
    if ([super isEditing])
    {
        metroStyleColors=self.editingMetroStyleColors;
    } else 
    {
        metroStyleColors=self.metroStyleColors;
    }
    
    drawGradientWithColors(metroStyleColors,rect);
    [super drawRect:rect];
}
*/



#pragma mark - Properties -

-(NSArray*)editingMetroStyleColors
{
    if (!_editingMetroStyleColors)
        _editingMetroStyleColors=METRO_DARK_COLORS;
    return _editingMetroStyleColors;
}

-(void)setEditingMetroStyleColors:(NSArray *)editingMetroStyleColors
{
    _editingMetroStyleColors=editingMetroStyleColors;
//    [self setNeedsDisplay];
    //[self animation];
    [self isEditing];
    
}

-(NSArray*)metroStyleColors
{
    if (!_metroStyleColors)
        _metroStyleColors=METRO_LIGHT_COLORS;
    return _metroStyleColors;
}

-(void)setMetroStyleColors:(NSArray *)metroStyleColors
{
    _metroStyleColors=metroStyleColors;
    [self isEditing];
//    [self setNeedsDisplay];
//    [self animation];
}



-(BOOL)isEditing
{
    //[self animation];
    //[self setNeedsDisplay];
    //[self performSelector:@selector(setNeedsDisplay) withObject:nil afterDelay:0.1];
    
    //restyle gradient layer
    //[self animation];
    
    if ([super isEditing])
    {
        _gradientLayer.colors=  [NSArray arrayWithObjects:(id)[[self.editingMetroStyleColors objectAtIndex:0] CGColor],
                                 (id)[[self.editingMetroStyleColors objectAtIndex:1] CGColor], nil];
    
    } else
    {
        _gradientLayer.colors=  [NSArray arrayWithObjects:(id)[[self.metroStyleColors objectAtIndex:0] CGColor],
                                 (id)[[self.metroStyleColors objectAtIndex:1] CGColor], nil];
    }
    
    
    return [super isEditing];
}


-(void)setPlaceholder:(NSString *)placeholder
{
    [super setPlaceholder:placeholder];
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
}





@end
