//
//  JTStyledButton.m
//  JTStyledButton
//
//  Created by user on 18.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledButton.h"

@interface JTStyledButton()

@property (nonatomic)   JTButtonType    buttonType;

-(void)_drawRectGradientButton;
-(void)_setImageToTopTextToBottom;
@end



@implementation JTStyledButton

@synthesize gradientLayer=_gradientLayer;

@synthesize highColor=_highColor;
@synthesize lowColor=_lowColor;
@synthesize highlightedHighColor=_highlightedHighColor;
@synthesize highlightedLowColor=_highlightedLowColor;
@synthesize selectedHighColor=_selectedHighColor;
@synthesize selectedLowColor=_selectedLowColor;

@synthesize buttonType=_buttonType;

#pragma mark -
#pragma mark - Properties

- (void)setHighColor:(UIColor*)color;
{
    _highColor=color;
    [[self layer] setNeedsDisplay];
}

- (void)setLowColor:(UIColor*)color;
{
    _lowColor=color;
    [[self layer] setNeedsDisplay];
}

-(void)setHighlightedHighColor:(UIColor *)highlightedHighColor
{
    _highlightedHighColor=highlightedHighColor;
    [[self layer] setNeedsDisplay];
}

-(void)setHighlightedLowColor:(UIColor *)highlightedLowColor
{
    _highlightedLowColor=highlightedLowColor;
    [[self layer] setNeedsDisplay];
}

-(void)setSelectedHighColor:(UIColor *)selectedHighColor
{
    _selectedHighColor=selectedHighColor;
    [[self layer] setNeedsDisplay];
}

-(void)setSelectedLowColor:(UIColor *)selectedLowColor
{
    _selectedLowColor=selectedLowColor;
    [[self layer] setNeedsDisplay];
}


-(void)setHighlighted:(BOOL)highlighted
{
    //    NSLog(@"HIGHLIGHTED %d",highlighted);
    [super setHighlighted:highlighted];
    [[self layer] performSelector:@selector(setNeedsDisplay) withObject:nil afterDelay:0.1]; 
    //    [[self layer] setNeedsDisplay]; 
    
    
    //[self updateControlState];
}



-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.gradientLayer.frame=self.bounds;
}



-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self _setImageToTopTextToBottom ];
}



-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self _setImageToTopTextToBottom ];
}


-(void)setSelected:(BOOL)selected
{
    //    NSLog(@"SELECTED %d",selected);
    [super setSelected:selected];
    //[[self layer] performSelector:@selector(setNeedsDisplay) withObject:nil afterDelay:0.1]; 
    [[self layer] setNeedsDisplay]; 
    
    
    //[self updateControlState];
}



#pragma mark - 
#pragma mark - Lyfecycle


- (void)dealloc
{
    self.selectedLowColor=nil;
    self.selectedHighColor=nil;
    self.highlightedLowColor=nil;
    self.highlightedHighColor=nil;
    self.lowColor=nil;
    self.highColor=nil;
    
    self.gradientLayer=nil;
}



+(id)gradientButton
{
    JTStyledButton *button=[JTStyledButton buttonWithType:UIButtonTypeCustom];
    if (button)
    {
        button.buttonType=JTButtonGradientType;
        button.gradientLayer = [CAGradientLayer layer];
        button.gradientLayer.frame = button.bounds;
        
        button.lowColor=[UIColor colorForHex:@"fbfbfb"];
        button.highColor=[UIColor colorForHex:@"cacaca"];
        button.highlightedLowColor=[UIColor colorForHex:@"f9fafd"];
        button.highlightedHighColor=[UIColor colorForHex:@"aac0ea"];
        button.selectedLowColor=[UIColor colorForHex:@"f9fafd"];
        button.selectedHighColor=[UIColor colorForHex:@"aac0ea"];
        
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];        
        
        [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        button.titleLabel.font=[UIFont boldSystemFontOfSize:12.f];
        
        button.gradientLayer.colors = [NSArray arrayWithObjects:(id)[button.lowColor CGColor], (id)[button.highColor CGColor], nil];
        
        
        button.layer.cornerRadius = 9.0f;
        button.layer.masksToBounds = YES;
        
        [button.layer insertSublayer:button.gradientLayer atIndex:0];//button.layer.sublayers.count];  
        [button bringSubviewToFront:button.imageView];
        
        //[button addObserver:button forKeyPath:@"frame" options:NSKeyValueObservingOptionOld context:NULL];
    }
    
    return button;
}




+(id)roundRectDarkGradientButton
{
    JTStyledButton *button=[JTStyledButton gradientButton];
    if (button)
    {
        button.layer.borderWidth=1.f;
        button.layer.borderColor=[UIColor darkGrayColor].CGColor;
        button.layer.cornerRadius = 11.0f;        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [button setTitleShadowColor:[UIColor clearColor] forState:UIControlStateHighlighted];
        [button setTitleShadowColor:[UIColor clearColor] forState:UIControlStateSelected];
        
    }
    return button;
}




+(id)roundRectLightGradientButton
{
    JTStyledButton *button=[JTStyledButton gradientButton];
    if (button)
    {
        button.layer.borderWidth=1.f;
        button.layer.borderColor=[UIColor lightGrayColor].CGColor;
        button.layer.cornerRadius = 11.0f;          
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];        
        [button setTitleShadowColor:[UIColor clearColor] forState:UIControlStateHighlighted];
        [button setTitleShadowColor:[UIColor clearColor] forState:UIControlStateSelected];
    }
    return button;
}







- (void)drawRect:(CGRect)rect;
{
    switch (self.buttonType) 
    {
        default:
        case JTButtonGradientType:
        {
            [self _drawRectGradientButton];
            break;
        }
    }
    
    [super drawRect:rect];
}




-(void)_drawRectGradientButton
{
    if (self.highColor && self.lowColor && self.highlightedLowColor && self.highlightedHighColor && self.selectedLowColor && self.selectedHighColor)
    {
        if ( (self.state == UIControlStateHighlighted) )
        {
            [self.gradientLayer setColors:[NSArray arrayWithObjects:(id)[self.highlightedLowColor CGColor], (id)[self.highlightedHighColor CGColor], nil]];
        } else
        if ( (self.state == UIControlStateSelected) )
        {
            [self.gradientLayer setColors:[NSArray arrayWithObjects:(id)[self.selectedLowColor CGColor], (id)[self.selectedHighColor CGColor], nil]];
        } else
        {
            [self.gradientLayer setColors:[NSArray arrayWithObjects:(id)[self.lowColor CGColor], (id)[self.highColor CGColor], nil]];
        }  
    }
}






-(void)_setImageToTopTextToBottom
{
    UIButton *button=self;
    // the space between the image and text
    CGFloat spacing = 0.0;
    
    // get the size of the elements here for readability
    CGSize imageSize = button.imageView.frame.size;
    //CGSize titleSize = button.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    button.titleEdgeInsets = UIEdgeInsetsMake(
                                              0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // the text width might have changed (in case it was shortened before due to 
    // lack of space and isn't anymore now), so we get the frame size again
    CGSize titleSize = button.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    button.imageEdgeInsets = UIEdgeInsetsMake(
                                              - (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);    
}

@end
