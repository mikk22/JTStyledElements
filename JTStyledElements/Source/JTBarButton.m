//
//  JTBarButton.m
//  Jeetrium
//
//  Created by user on 16.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTBarButton.h"

@interface JTBarButton()
{
}

@property (nonatomic)   JTBarButtonType    buttonType;

-(void)_drawRectBarButton;

@end



@implementation JTBarButton

@synthesize gradientLayer=_gradientLayer;

@synthesize highColor=_highColor;
@synthesize lowColor=_lowColor;
@synthesize highlightedHighColor=_highlightedHighColor;
@synthesize highlightedLowColor=_highlightedLowColor;
@synthesize selectedHighColor=_selectedHighColor;
@synthesize selectedLowColor=_selectedLowColor;

@synthesize buttonType=_buttonType;

@synthesize selectedImageTintColor=_selectedImageTintColor;
@synthesize textSpacing=_textSpacing;
@synthesize selectedAlpha=_selectedAlpha;

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


-(void)setSelected:(BOOL)selected
{
//    NSLog(@"SELECTED %d",selected);
    [super setSelected:selected];
    //[[self layer] performSelector:@selector(setNeedsDisplay) withObject:nil afterDelay:0.1]; 
    [[self layer] setNeedsDisplay]; 
    
    
    //[self updateControlState];
}





-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    //self.gradientLayer.frame=self.bounds;
}


/*
-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    if (state==UIControlStateNormal)
    {
        
        UIImage *selectedImage=[image tintedWithLinearGradientColors:
                                [NSArray arrayWithObjects:
                                 [UIColor whiteColor], 
                                 self.selectedImageTintColor,    nil] Alpha:self.selectedAlpha];
        [super setImage:selectedImage forState:UIControlStateSelected];
    }

   // [self _setImageToTopTextToBottom ];
    //[self setNeedsLayout];
}
*/



- (UIColor *)selectedImageTintColor
{
    // use blue tint by default
    return _selectedImageTintColor != nil ? _selectedImageTintColor : [UIColor colorWithRed:41.0/255.0 green:147.0/255.0 blue:239.0/255.0 alpha:1.0];
}



-(CGFloat)selectedAlpha
{
    if (_selectedAlpha==0.f)
        _selectedAlpha=0.7f;
    
    return _selectedAlpha;
}



#pragma mark - 
#pragma mark - Lyfecycle


- (void)dealloc
{
//    [self removeObserver:self forKeyPath:@"frame"];
    
    self.selectedLowColor=nil;
    self.selectedHighColor=nil;
    self.highlightedLowColor=nil;
    self.highlightedHighColor=nil;
    self.lowColor=nil;
    self.highColor=nil;
    
    self.gradientLayer=nil;
}




+(id)barButton
{
    JTBarButton *button=[JTBarButton buttonWithType:UIButtonTypeCustom];
    if (button)
    {
        button.buttonType=JTBarButtonBarType;
        button.textSpacing=2.f;
        //
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];        
        
        //[button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        //button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        button.titleLabel.font=[UIFont boldSystemFontOfSize:12.f];
        
        button.layer.cornerRadius = 0.0f;
        button.layer.masksToBounds = NO;
        
        button.imageView.layer.cornerRadius= 9.0f;
        button.imageView.layer.masksToBounds= YES;//button.layer.masksToBounds;
        button.imageView.contentMode=UIViewContentModeScaleAspectFill;
        button.titleLabel.textAlignment=UITextAlignmentCenter;
        
        [button bringSubviewToFront:button.titleLabel];

        //[button _setImageToTopTextToBottom];
    }
    
    return button;
}



+(id)toolbarButton
{
    JTBarButton *button=[JTBarButton buttonWithType:UIButtonTypeCustom];
    if (button)
    {
        button.buttonType=JTBarButtonToolbarType;
        button.textSpacing=2.f;
        //
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];        
        
        //[button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        //button.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
        button.titleLabel.font=[UIFont boldSystemFontOfSize:12.f];
        
        button.layer.cornerRadius = 0.0f;
        button.layer.masksToBounds = YES;
        
//        button.imageView.layer.cornerRadius= 9.0f;
//        button.imageView.layer.masksToBounds= YES;//button.layer.masksToBounds;
        button.imageView.contentMode=UIViewContentModeScaleAspectFill;
        button.titleLabel.textAlignment=UITextAlignmentCenter;
        
        //[button _setImageToTopTextToBottom];
    }
    
    return button;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat spacing = self.textSpacing;

    CGRect imageFrame=CGRectZero;
    CGRect titleFrame;// = self.titleLabel.frame;
    
    switch (self.buttonType)
    {
        default:
        case JTBarButtonBarType:
        {
            imageFrame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetWidth(self.bounds));//self.imageView.frame;
            titleFrame = CGRectMake(0.0f,
                                    0.0f,//truncf((self.bounds.size.height + imageFrame.size.height + spacing) / 2),
                                    CGRectGetWidth(self.bounds),
                                    15.f/*titleFrame.size.height*/);
            break;
        }    
        case JTBarButtonToolbarType:
        {
            imageFrame = CGRectMake(CGRectGetMidX(self.bounds)-TOOLBAR_BUTTON_IMAGE_WIDTH/2,
                                    CGRectGetMidY(self.bounds)-TOOLBAR_BUTTON_IMAGE_HEIGHT/2,
                                    TOOLBAR_BUTTON_IMAGE_WIDTH,
                                    TOOLBAR_BUTTON_IMAGE_HEIGHT);
            titleFrame = CGRectMake(0.0f,
                                    truncf(CGRectGetMaxY(imageFrame)+spacing),//truncf((self.bounds.size.height + imageFrame.size.height + spacing) / 2),
                                    CGRectGetWidth(self.bounds),
                                    15.f/*titleFrame.size.height*/);
            break;
        }    
    }
    
    
    
    
    
    
    


    /*
    imageFrame = CGRectMake(truncf((self.bounds.size.width - imageFrame.size.width) / 2),
                            truncf((self.bounds.size.height - imageFrame.size.height - spacing -titleFrame.size.height) / 2 ),
                            imageFrame.size.width,
                            imageFrame.size.height);
    */
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = titleFrame;
    
//    NSLog(@"I %f %f %f %f",imageFrame.origin.x,imageFrame.origin.y,imageFrame.size.width,imageFrame.size.height);
//    NSLog(@"T %f %f %f %f %@",titleFrame.origin.x,titleFrame.origin.y,titleFrame.size.width,titleFrame.size.height,self);
    
}



- (void)drawRect:(CGRect)rect;
{
    switch (self.buttonType) 
    {
        default:
        case JTBarButtonBarType:
        {
            //[self _drawRectBarButton];
            break;
        }
    }

    [super drawRect:rect];
}


-(void)_drawRectBarButton
{
    CGRect bounds = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // flip the coordinates system
    CGContextTranslateCTM(context, 0.0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // draw an image in the center of the cell
    UIImage *iconImage=[UIImage imageNamed:@"undo.png"];//[self imageForState:UIControlStateNormal];

    CGSize imageSize = iconImage.size;
    CGRect imageRect = CGRectMake(floorf(((bounds.size.width-imageSize.width)/2.0)),
                                  floorf(((bounds.size.height-imageSize.height)/2.0)),
                                  imageSize.width,
                                  imageSize.height);
    
    // draw either a selection gradient/glow or a regular image
    if (self.isSelected)
    {
        // setup shadow
        CGSize shadowOffset = CGSizeMake(0.0f, 2.0f);
        CGFloat shadowBlur = 3.0;
        CGColorRef cgShadowColor = [[UIColor blackColor] CGColor];
        
        // setup gradient
        CGFloat alpha0 = 0.8;
        CGFloat alpha1 = 0.6;
        CGFloat alpha2 = 0.0;
        CGFloat alpha3 = 0.1;
        CGFloat alpha4 = 0.5;
        CGFloat locations[5] = {0,0.55,0.55,0.7,1};
        
        CGFloat components[20] = {1,1,1,alpha0,1,1,1,alpha1,1,1,1,alpha2,1,1,1,alpha3,1,1,1,alpha4};
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef colorGradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, (size_t)5);
        CGColorSpaceRelease(colorSpace);
        
        // set shadow
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlur, cgShadowColor);
        
        // set transparency layer and clip to mask
        CGContextBeginTransparencyLayer(context, NULL);
        CGContextClipToMask(context, imageRect, [iconImage CGImage]);
        
        // fill and end the transparency layer
        CGContextSetFillColorWithColor(context, [self.selectedImageTintColor CGColor]);
        CGContextFillRect(context, imageRect);
        CGPoint start = CGPointMake(CGRectGetMidX(imageRect), imageRect.origin.y);
        CGPoint end = CGPointMake(CGRectGetMidX(imageRect)-imageRect.size.height/4, imageRect.size.height+imageRect.origin.y);
        CGContextDrawLinearGradient(context, colorGradient, end, start, 0);
        CGContextEndTransparencyLayer(context);
        
        CGGradientRelease(colorGradient);
    }
    else
    {
        CGContextDrawImage(context,
                           imageRect,
                           iconImage.CGImage);
    }
}





/*
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"frame"])
    {
        //NSLog(@"OBSERVER!");
        CGRect oldFrame = CGRectNull;
        CGRect newFrame = CGRectNull;
        if([change objectForKey:@"old"] != [NSNull null])
        {
            oldFrame = [[change objectForKey:@"old"] CGRectValue];
        }
        if([object valueForKeyPath:keyPath] != [NSNull null])
        {
            newFrame = [[object valueForKeyPath:keyPath] CGRectValue];
            self.gradientLayer.frame=CGRectMake(0, 0, CGRectGetWidth(newFrame), CGRectGetHeight(newFrame));
        }
    }
}
*/







/*
-(void)_setImageToTopTextToBottom
{
    UIButton *button=self;
    // the space between the image and text
    CGFloat spacing = 0.0f;//self.textSpacing;
    
    button.imageEdgeInsets=UIEdgeInsetsZero;
    button.titleEdgeInsets=UIEdgeInsetsZero;
    
    
    // get the size of the elements here for readability
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSize = button.titleLabel.frame.size;

    // lower the text and push it left to center it
    button.titleEdgeInsets = UIEdgeInsetsMake(
                                              0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // the text width might have changed (in case it was shortened before due to 
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = button.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    button.imageEdgeInsets = UIEdgeInsetsMake(
                                              - (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
    //[button setNeedsDisplay];
}
*/


-(NSString*)description
{
    return self.titleLabel.text;
}


@end
