//
//  JTPopupVie.m
//  Jeetrium
//
//  Created by user on 02.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//
#import "JTPopupView.h"
#import <QuartzCore/QuartzCore.h>
#import "JTStyledDefines.h"

@implementation JTPopupView

@synthesize fillColor=_fillColor;
@synthesize metroStyleColors=_metroStyleColors;
@synthesize arrowStyle=_arrowStyle;
@synthesize arrowLayer=_arrowLayer;

-(void)setFillColor:(UIColor *)fillColor
{
    _fillColor=fillColor;
    self.arrowLayer.strokeColor=fillColor.CGColor;
    self.arrowLayer.lineWidth=1.f;
}



-(void)setMetroStyleColors:(NSArray *)metroStyleColors
{
    if (metroStyleColors.count>1)
    {
        _metroStyleColors=metroStyleColors;
        self.gradientLayer.colors = @[(id)((UIColor*)[metroStyleColors objectAtIndex:0]).CGColor, (id)((UIColor*)[metroStyleColors objectAtIndex:1]).CGColor];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //layers
        self.layer.masksToBounds = NO;
        self.arrowLayer=[[CAShapeLayer alloc] init];
        self.arrowLayer.shadowOffset = CGSizeMake(-METRO_ARROWVIEW_SHADOW_OFFSET, -METRO_ARROWVIEW_SHADOW_OFFSET);
        self.arrowLayer.shadowRadius = 4;
        self.arrowLayer.shadowOpacity = 0.6;
        self.arrowLayer.backgroundColor=[UIColor clearColor].CGColor;
        self.arrowLayer.shouldRasterize=YES;
        self.arrowLayer.masksToBounds=NO;
        self.arrowLayer.rasterizationScale=[UIScreen mainScreen].scale;
        [self.layer addSublayer:self.arrowLayer];
        
        self.gradientShapeLayer=[[CAShapeLayer alloc] init];
        self.gradientLayer=[[CAGradientLayer alloc] init];
        self.gradientLayer.mask=self.gradientShapeLayer;
        [self.arrowLayer addSublayer:self.gradientLayer];

        self.backgroundColor=[UIColor clearColor];
        self.metroStyleColors=[NSArray arrayWithObjects:METRO_WHITE_START_COLOR,METRO_WHITE_END_COLOR, nil];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    switch (self.arrowStyle)
    {
        case JTStyledArrowViewArrowTop:
        {
            self.arrowLayer.frame=CGRectMake(0, -METRO_ARROWVIEW_ARROW_HEIGHT, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)+METRO_ARROWVIEW_ARROW_HEIGHT);
            self.arrowLayer.path=[self arrowTopPathForRect:self.arrowLayer.bounds];
            break;
        }
        case JTStyledArrowViewArrowLeft:
        {
            self.arrowLayer.frame=CGRectMake(-METRO_ARROWVIEW_ARROW_HEIGHT, 0, CGRectGetWidth(self.bounds)+METRO_ARROWVIEW_ARROW_HEIGHT, CGRectGetHeight(self.bounds));
            self.arrowLayer.path=[self arrowLeftPathForRect:self.arrowLayer.bounds];
            break;
        }
        default:
            break;
    }
    
    self.gradientShapeLayer.path=self.arrowLayer.path;
    self.gradientShapeLayer.frame=self.arrowLayer.bounds;
    self.gradientLayer.frame=self.arrowLayer.bounds;
}


-(void)setArrowStyle:(JTStyledArrowViewArrowPosition)arrowStyle
{
    _arrowStyle=arrowStyle;
    
    switch (arrowStyle)
    {
        case JTStyledArrowViewArrowTop:
        {
            self.arrowLayer.shadowOffset = CGSizeMake(-METRO_ARROWVIEW_SHADOW_OFFSET, -METRO_ARROWVIEW_SHADOW_OFFSET);
            break;
        }
        case JTStyledArrowViewArrowLeft:
        {
            self.arrowLayer.shadowOffset = CGSizeMake(-METRO_ARROWVIEW_SHADOW_OFFSET, METRO_ARROWVIEW_SHADOW_OFFSET);
            break;
        }
        default:
            break;
    }
    
    [self setNeedsLayout];
}


//helpers


-(CGPathRef)arrowTopPathForRect:(CGRect)rect
{
    CGFloat minx = CGRectGetMinX(rect), maxx = CGRectGetMaxX(rect); //, midx = CGRectGetMidX(rect)
    CGFloat miny = CGRectGetMinY(rect), maxy = CGRectGetMaxY(rect); //, midy = CGRectGetMidY(rect)
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    //
    //arrow
    //
    CGPathMoveToPoint(path, NULL, minx, miny+METRO_ARROWVIEW_ARROW_HEIGHT);
    CGPathAddLineToPoint(path, NULL, minx+METRO_ARROWVIEW_ARROW_LEFT_OFFSET, miny+METRO_ARROWVIEW_ARROW_HEIGHT);
    CGPathAddLineToPoint(path, NULL, minx+METRO_ARROWVIEW_ARROW_LEFT_OFFSET+METRO_ARROWVIEW_ARROW_WIDTH, miny);
    CGPathAddLineToPoint(path, NULL, minx+METRO_ARROWVIEW_ARROW_LEFT_OFFSET+2*METRO_ARROWVIEW_ARROW_WIDTH, miny+METRO_ARROWVIEW_ARROW_HEIGHT);
    //
    CGPathAddLineToPoint(path, NULL, maxx, miny+METRO_ARROWVIEW_ARROW_HEIGHT);
    CGPathAddLineToPoint(path, NULL, maxx, maxy);
    CGPathAddLineToPoint(path, NULL, minx, maxy);
    CGPathAddLineToPoint(path, NULL, minx, miny+METRO_ARROWVIEW_ARROW_HEIGHT);
    
    CGPathCloseSubpath(path);
    
    return path;
}


-(CGPathRef)arrowLeftPathForRect:(CGRect)rect
{
    CGFloat minx = CGRectGetMinX(rect), maxx = CGRectGetMaxX(rect); //, midx = CGRectGetMidX(rect)
    CGFloat miny = CGRectGetMinY(rect), maxy = CGRectGetMaxY(rect); //, midy = CGRectGetMidY(rect)
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, minx, miny);
    CGPathAddLineToPoint(path, NULL, maxx, miny);
    CGPathAddLineToPoint(path, NULL, maxx, maxy);
    //
    //arrow
    //
    CGPathAddLineToPoint(path, NULL, minx+METRO_ARROWVIEW_ARROW_HEIGHT, maxy);
    CGPathAddLineToPoint(path, NULL, minx+METRO_ARROWVIEW_ARROW_HEIGHT,
                         miny+METRO_ARROWVIEW_ARROW_LEFT_OFFSET+2*METRO_ARROWVIEW_ARROW_WIDTH);
    CGPathAddLineToPoint(path, NULL, minx,
                         miny+METRO_ARROWVIEW_ARROW_LEFT_OFFSET+METRO_ARROWVIEW_ARROW_WIDTH);
    CGPathAddLineToPoint(path, NULL, minx+METRO_ARROWVIEW_ARROW_HEIGHT,
                         miny+METRO_ARROWVIEW_ARROW_LEFT_OFFSET);
    CGPathAddLineToPoint(path, NULL, minx+METRO_ARROWVIEW_ARROW_HEIGHT, miny);
    
    CGPathCloseSubpath(path);
    
    return path;
}


@end
