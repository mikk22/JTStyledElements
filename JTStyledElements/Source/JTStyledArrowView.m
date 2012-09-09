//
//  JTMetroArrowView.m
//  Jeetrium
//
//  Created by user on 02.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//
#import "JTStyledArrowView.h"
#import <QuartzCore/QuartzCore.h>
#import "JTStyledDefines.h"

@implementation JTStyledArrowView

@synthesize fillColor=_fillColor;
@synthesize metroStyleColors=_metroStyleColors;
@synthesize arrowStyle=_arrowStyle;

-(void)setFillColor:(UIColor *)fillColor
{
    _fillColor=fillColor;
    [self setNeedsDisplay];
}



-(void)setMetroStyleColors:(NSArray *)metroStyleColors
{
    _metroStyleColors=metroStyleColors;
    [self setNeedsDisplay];
}



/*
+ (void)roundedLayer:(CALayer *)viewLayer 
              radius:(float)r 
              shadow:(BOOL)s
{
    [viewLayer setMasksToBounds:YES];
    [viewLayer setCornerRadius:r];        
    [viewLayer setBorderColor:[RGB(180, 180, 180) CGColor]];
    [viewLayer setBorderWidth:1.0f];
    if(s)
    {
        [viewLayer setShadowColor:[RGB(0, 0, 0) CGColor]];
        [viewLayer setShadowOffset:CGSizeMake(0, 0)];
        [viewLayer setShadowOpacity:1];
        [viewLayer setShadowRadius:2.0];
    }
    return;
}
*/

-(void)dealloc
{
    self.fillColor=nil;
    self.metroStyleColors=nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //self.clipsToBounds=YES;
        
        self.layer.masksToBounds = NO;
        
        //self.layer.cornerRadius = 8; // if you like rounded corners
        
        
        self.layer.shadowOffset = CGSizeMake(0, -5);
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = 0.6;
        self.layer.shouldRasterize=YES;
        self.layer.rasterizationScale=[UIScreen mainScreen].scale;
        
        self.backgroundColor=[UIColor clearColor];
        
        //self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        self.metroStyleColors=[NSArray arrayWithObjects:METRO_WHITE_START_COLOR,METRO_WHITE_END_COLOR, nil];    
    }
    return self;
}
/*
- (BOOL) isOpaque {
    return NO;
}
*/


/*
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.frame=self.frame;
    [self setNeedsDisplay];
}
*/


-(void)setArrowStyle:(JTStyledArrowViewArrowPosition)arrowStyle
{
    _arrowStyle=arrowStyle;
    
    
    switch (arrowStyle)
    {
        case JTStyledArrowViewArrowTop:
        {
            self.layer.shadowOffset = CGSizeMake(0, -5);
            break;
        }
        case JTStyledArrowViewArrowLeft:
        {
            self.layer.shadowOffset = CGSizeMake(-5, 5);
            break;
        }
        default:
            break;
    }
    
    [self setNeedsDisplay];
}




-(void)drawRect:(CGRect)aRect {
    // Drawing code
    
    CGContextRef c = UIGraphicsGetCurrentContext();	
    
    int lineWidth = 1;
	
    CGRect rect = [self bounds];	
    CGFloat minx = CGRectGetMinX(rect), maxx = CGRectGetMaxX(rect); //, midx = CGRectGetMidX(rect)
    CGFloat miny = CGRectGetMinY(rect), maxy = CGRectGetMaxY(rect); //, midy = CGRectGetMidY(rect)
    miny -= 1;

    CGColorRef  startColor=[[_metroStyleColors objectAtIndex:0] CGColor];
    CGColorRef  endColor=[[_metroStyleColors objectAtIndex:1] CGColor];
    
    NSArray *colors = [NSArray arrayWithObjects:
                       (__bridge id)startColor, 
                       (__bridge id)endColor, nil];
	
    
    
    CGFloat locations[2] = { 0.0, 1.0 };
    CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
    CGContextSetStrokeColorWithColor(c, [self.fillColor CGColor]);
    CGContextSetLineWidth(c, lineWidth);
    CGContextSetAllowsAntialiasing(c, YES);
    CGContextSetShouldAntialias(c, YES);
    
    
    //if (position == UACellBackgroundViewPositionTop) {
		
        miny += 1;
		
    CGMutablePathRef path = CGPathCreateMutable();
    
    switch (self.arrowStyle)
    {
        case JTStyledArrowViewArrowTop:
        {
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
            break;
        }
        case JTStyledArrowViewArrowLeft:
        {
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
            
            break;
        }
        default:
            break;
    }
    

    CGPathCloseSubpath(path);
    
    // Fill and stroke the path
    CGContextSaveGState(c);
    CGContextAddPath(c, path);
    
//    CGContextSetFillColorWithColor(c, [self.fillColor CGColor]);
//    CGContextFillPath(c);
    
    CGContextClip(c);
	
    CGGradientRef myGradient = CGGradientCreateWithColors(myColorspace, 
                                            (__bridge CFArrayRef) colors, locations);//CGGradientCreateWithColorComponents(myColorspace, components, locations, 2);
    CGContextDrawLinearGradient(c, myGradient, CGPointMake(minx,miny), CGPointMake(minx,maxy), 0);
    
        CGContextAddPath(c, path);
        CGGradientRelease(myGradient);
        CGPathRelease(path);
        CGContextStrokePath(c);
        CGContextRestoreGState(c);		
	
    CGColorSpaceRelease(myColorspace);
    
    return;
}


@end

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,float ovalHeight) {
    float fw, fh;
	
    if (ovalWidth == 0 || ovalHeight == 0) {// 1
        CGContextAddRect(context, rect);
        return;
    }
	
    CGContextSaveGState(context);// 2
	
    CGContextTranslateCTM (context, CGRectGetMinX(rect),// 3
                           CGRectGetMinY(rect));
    CGContextScaleCTM (context, ovalWidth, ovalHeight);// 4
    fw = CGRectGetWidth (rect) / ovalWidth;// 5
    fh = CGRectGetHeight (rect) / ovalHeight;// 6
	
    CGContextMoveToPoint(context, fw, fh/2); // 7
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);// 8
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);// 9
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);// 10
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // 11
    CGContextClosePath(context);// 12
	
    CGContextRestoreGState(context);// 13
}

