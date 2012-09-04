//
//  JTRoundRectButton.m
//  JTPagedView.h
//
//  Created by Mihail Koltsov on 6/13/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTRoundRectButton.h"


@interface JTRoundRectButton ()
{
    NSString    *_pictureName;
    NSUInteger  _buttonType;
}

@property (nonatomic)           NSUInteger  buttonType;

@end


@implementation JTRoundRectButton

@synthesize fillColor=_fillColor;
@synthesize selectedFillColor=_selectedFillColor;
@synthesize borderColor=_borderColor;
@synthesize selectedBorderColor=_selectedBorderColor;

@synthesize pictureName=_pictureName;
@synthesize buttonType=_buttonType;
@synthesize textLabel=_textLabel;
@synthesize imageView=_imageView;


-(void)dealloc
{
    self.fillColor=nil;
    self.selectedFillColor=nil;
    self.borderColor=nil;
    self.selectedBorderColor=nil;

    self.textLabel=nil;
    self.imageView=nil;
    self.pictureName=nil;
}

+(id)rejeetButton
{
    JTRoundRectButton *button=[[JTRoundRectButton alloc] initWithFrame:CGRectZero];
    if (button)
    {
        button.pictureName=@"iconButtonRejeet.png";
        button.selectedFillColor=[UIColor lightGrayColor];
    }
    
    return button;
}



+(id)recommendButton
{
    JTRoundRectButton *button=[[JTRoundRectButton alloc] initWithFrame:CGRectZero];
    if (button)
    {
        button.pictureName=@"iconButtonRecommend.png";
        button.selectedFillColor=[UIColor lightGrayColor];
    }
    
    return button;
}


+(id)isLikedButton
{
    JTRoundRectButton *button=[[JTRoundRectButton alloc] initWithFrame:CGRectZero];
    if (button)
    {
        button.pictureName=@"iconButtonLike.png";
        button.selectedFillColor=[UIColor lightGrayColor];
        button.textLabel.textColor=[UIColor whiteColor];
        button.textLabel.font=[UIFont systemFontOfSize:12.f];
    }
    
    return button;
}



+(id)noLikeButton
{
    JTRoundRectButton *button=[[JTRoundRectButton alloc] initWithFrame:CGRectZero];
    if (button)
    {
        button.pictureName=@"iconButtonNoLike.png";
        button.selectedFillColor=[UIColor lightGrayColor];
        button.textLabel.textColor=[UIColor whiteColor];
        button.textLabel.font=[UIFont systemFontOfSize:12.f];
    }
    
    return button;
}



+(id)commentButton
{
    JTRoundRectButton *button=[[JTRoundRectButton alloc] initWithFrame:CGRectZero];
    if (button)
    {
        button.pictureName=@"iconButtonComment.png";
        button.selectedFillColor=[UIColor lightGrayColor];
        button.textLabel.textColor=[UIColor whiteColor];
        button.textLabel.font=[UIFont systemFontOfSize:12.f];
    }
    
    return button;
}



+(id)borderedButton
{
    JTRoundRectButton *button=[[JTRoundRectButton alloc] initWithFrame:CGRectZero];
    if (button)
    {
        button.borderColor=[UIColor blackColor];
        button.selectedBorderColor=[UIColor blackColor];
    }
    
    return button;
}



+(id)noBorderButton
{
    JTRoundRectButton *button=[[JTRoundRectButton alloc] initWithFrame:CGRectZero];
    if (button)
    {
        button.borderColor=[UIColor clearColor];
        button.selectedBorderColor=[UIColor clearColor];
    }
    
    return button;
}


+(id)arrowUpButton
{
    JTRoundRectButton *button=[JTRoundRectButton noBorderButton];
    if (button)
    {
        button.pictureName=@"iconArrowUP.png";
    }
    
    return button;
}








- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        //[self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionOld context:NULL];
     
        self.imageView=[[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.imageView];
        
        self.textLabel=[[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.backgroundColor=[UIColor clearColor];
        self.textLabel.textAlignment=UITextAlignmentCenter;
        self.textLabel.font=[UIFont systemFontOfSize:20.f];
        [self addSubview:self.textLabel];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGRect buttonRect = CGRectMake(1, 1, CGRectGetWidth(self.bounds)-2, CGRectGetHeight(self.bounds)-2);
    
    UIColor *fillColor=( (self.state == UIControlStateHighlighted) || ( self.state == UIControlStateSelected )) ? self.selectedFillColor : self.fillColor ;
    [fillColor setFill];
    CGContextFillEllipseInRect(context, buttonRect);

    UIColor *borderColor=( (self.state == UIControlStateHighlighted) || ( self.state == UIControlStateSelected )) ? self.selectedBorderColor : self.borderColor ;
    [borderColor setStroke];
    CGContextSetLineWidth(context, 2.f);
    CGRect innerBorderRect = CGRectMake(4, 4, CGRectGetWidth(/*self.bounds*/rect)-8, CGRectGetHeight(rect/*self.bounds*/)-8);
    CGContextStrokeEllipseInRect(context, innerBorderRect);
    
    UIImage *myImage = [UIImage imageNamed:self.pictureName];
    CGPoint point=CGPointMake(CGRectGetMidX(buttonRect)-myImage.size.width/2, CGRectGetMidY(buttonRect)-myImage.size.height/2);
    [myImage drawAtPoint:point];
    
    CGContextRestoreGState(context);
}



#pragma mark - Properties - 

-(UIColor*)fillColor
{
    if (!_fillColor)
        _fillColor=[UIColor whiteColor];
    
    return _fillColor;
}

-(void)setFillColor:(UIColor *)fillColor
{
    _fillColor=fillColor;
    [self setNeedsDisplay];
}

-(UIColor*)selectedFillColor
{
    if (!_selectedFillColor)
        _selectedFillColor=[UIColor whiteColor];
    
    return _selectedFillColor;
}

-(void)setSelectedFillColor:(UIColor *)selectedFillColor
{
    _selectedFillColor=selectedFillColor;
    [self setNeedsDisplay];
}

-(UIColor*)borderColor
{
    if (!_borderColor)
        _borderColor=[UIColor blackColor];
    
    return _borderColor;
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor=borderColor;
    [self setNeedsDisplay];
}

-(UIColor*)selectedBorderColor
{
    if (!_selectedBorderColor)
        _selectedBorderColor=[UIColor blackColor];
    
    return _selectedBorderColor;
}

-(void)setSelectedBorderColor:(UIColor *)selectedBorderColor
{
    _selectedBorderColor=selectedBorderColor;
    [self setNeedsDisplay];
}


-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}


-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsDisplay];
}


-(void)setPictureName:(NSString *)pictureName
{
    _pictureName=pictureName;
    [self setNeedsDisplay];
}

/*
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"highlighted"])
    {
        NSLog(@"OBSERVER! HICHLIGHTED");
        CGRect oldFrame = CGRectNull;
        CGRect newFrame = CGRectNull;
        if([change objectForKey:@"old"] != [NSNull null])
        {
            oldFrame = [[change objectForKey:@"old"] CGRectValue];
        }
        if([object valueForKeyPath:keyPath] != [NSNull null])
        {
            //newFrame = [[object valueForKeyPath:keyPath] CGRectValue];
            NSLog(@"BOOL %d",[[object valueForKeyPath:keyPath] boolValue]);
            //self.gradientLayer.frame=CGRectMake(0, 0, CGRectGetWidth(newFrame), CGRectGetHeight(newFrame));
        }
    }
}
*/




-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame=self.bounds;
    self.textLabel.frame=self.bounds;
}



@end
