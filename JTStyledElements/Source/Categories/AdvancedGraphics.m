//
//  AdvancedGraphics.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "AdvancedGraphics.h"
#import "UIColor+AdvancedColors.h"

#define INSIDE_INNER_SHADOW_VIEW_OFFSET     3.f
#define OUTSIDE_INNER_SHADOW_PATH_OFFSET    (4*INSIDE_INNER_SHADOW_VIEW_OFFSET)
#define INSIDE_INNER_SHADOW_BLUR            3*INSIDE_INNER_SHADOW_VIEW_OFFSET

#define INSIDE_INNER_SHADOW_COLOR           [UIColor blackColor]
#define INSIDE_INNER_BORDER_COLOR           [UIColor colorForHex:@"d4d4d4"]
#define INSIDE_INNER_SPACE_COLOR            [UIColor colorForHex:@"ededed"]
#define INSIDE_INNER_SHADOW_ALPHA           0.18f


void drawMetroStyleFillinContext(CGContextRef context, CGRect rect)
{
    //    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGContextSaveGState(context);
    CGContextSetAlpha(context, INSIDE_INNER_SHADOW_ALPHA);
    CGContextSaveGState(context);
    
    CGRect outsideRect=CGRectMake(-OUTSIDE_INNER_SHADOW_PATH_OFFSET,
                                  -OUTSIDE_INNER_SHADOW_PATH_OFFSET,
                                  CGRectGetWidth(rect)+2*OUTSIDE_INNER_SHADOW_PATH_OFFSET,
                                  CGRectGetHeight(rect)+2*OUTSIDE_INNER_SHADOW_PATH_OFFSET);
    
    CGContextSetShadowWithColor(context, CGSizeMake(INSIDE_INNER_SHADOW_VIEW_OFFSET, INSIDE_INNER_SHADOW_VIEW_OFFSET),
                                INSIDE_INNER_SHADOW_BLUR, INSIDE_INNER_SHADOW_COLOR.CGColor);
    
    CGPathRef outsidePath=CGPathCreateWithRect(outsideRect, NULL);
    CGContextAddPath(context, outsidePath);
    
    CGPathRef borderPath=CGPathCreateWithRect(rect, NULL);
    CGContextAddPath(context, borderPath);
    
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);
    
    CGContextAddPath(context, outsidePath);
    CGContextAddPath(context, borderPath);
    
    CGPathRelease(outsidePath);
    CGPathRelease(borderPath);
    
    
    CGContextSetShadowWithColor(context, CGSizeMake(-INSIDE_INNER_SHADOW_VIEW_OFFSET, -INSIDE_INNER_SHADOW_VIEW_OFFSET),
                                INSIDE_INNER_SHADOW_BLUR, INSIDE_INNER_SHADOW_COLOR.CGColor);
    //    CGContextSetAlpha(context, 0.2);
    CGContextEOFillPath(context);    
    CGContextRestoreGState(context);
    
    
    CGPathRef strokeBorderPath=CGPathCreateWithRect(rect, NULL);
    CGContextAddPath(context, strokeBorderPath);
    CGPathRelease(strokeBorderPath);
    CGContextSetLineWidth(context, 2.0);
    [INSIDE_INNER_BORDER_COLOR setStroke];
    [[INSIDE_INNER_SPACE_COLOR colorWithAlphaComponent:0.6] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextRestoreGState(context);
}







void drawGradientWithColors(NSArray *_colors, CGRect frame)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat locations[] = { 0.0, 1.0 };
    
    CGColorRef  startColor=[[_colors objectAtIndex:0] CGColor];
    CGColorRef  endColor=[[_colors objectAtIndex:1] CGColor];
    
    NSArray *colors = [NSArray arrayWithObjects:
                       (__bridge id)startColor, 
                       (__bridge id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, 
                                                        (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, frame);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    // bottom line
    /*
    CGFloat red, green, blue, alpha;
    [[_colors objectAtIndex:0] getRed:&red green:&green blue:&blue alpha:&alpha];
    CGContextSetRGBStrokeColor(context, red, green, blue, alpha);    
    CGContextMoveToPoint(context, CGRectGetMinX(frame), CGRectGetMaxY(frame));
    CGContextAddLineToPoint(context, CGRectGetMaxX(frame), CGRectGetMaxY(frame));
    CGContextStrokePath(context);
    */
}



void drawEllipseWithColorInContext(CGContextRef context, UIColor *color, CGRect rect)
{
    //    CGContextRef context=UIGraphicsGetCurrentContext();
    /*
    CGContextSaveGState(context);
    
    CGContextSaveGState(context);
    CGContextSetAlpha(context, INSIDE_INNER_SHADOW_ALPHA);
    CGContextSaveGState(context);
    
    CGRect outsideRect=CGRectMake(-OUTSIDE_INNER_SHADOW_PATH_OFFSET,
                                  -OUTSIDE_INNER_SHADOW_PATH_OFFSET,
                                  CGRectGetWidth(rect)+2*OUTSIDE_INNER_SHADOW_PATH_OFFSET,
                                  CGRectGetHeight(rect)+2*OUTSIDE_INNER_SHADOW_PATH_OFFSET);
    
    CGContextSetShadowWithColor(context, CGSizeMake(INSIDE_INNER_SHADOW_VIEW_OFFSET, INSIDE_INNER_SHADOW_VIEW_OFFSET),
                                INSIDE_INNER_SHADOW_BLUR, INSIDE_INNER_SHADOW_COLOR.CGColor);
    
    CGPathRef outsidePath=CGPathCreateWithRect(outsideRect, NULL);
    CGContextAddPath(context, outsidePath);
    
    CGPathRef borderPath=CGPathCreateWithRect(rect, NULL);
    CGContextAddPath(context, borderPath);
    
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);
    
    CGContextAddPath(context, outsidePath);
    CGContextAddPath(context, borderPath);
    
    CGPathRelease(outsidePath);
    CGPathRelease(borderPath);
    
    
    CGContextSetShadowWithColor(context, CGSizeMake(-INSIDE_INNER_SHADOW_VIEW_OFFSET, -INSIDE_INNER_SHADOW_VIEW_OFFSET),
                                INSIDE_INNER_SHADOW_BLUR, INSIDE_INNER_SHADOW_COLOR.CGColor);
    //    CGContextSetAlpha(context, 0.2);
    CGContextEOFillPath(context);
    CGContextRestoreGState(context);
    
    
    CGPathRef strokeBorderPath=CGPathCreateWithRect(rect, NULL);
    CGContextAddPath(context, strokeBorderPath);
    CGPathRelease(strokeBorderPath);
    CGContextSetLineWidth(context, 2.0);
    [INSIDE_INNER_BORDER_COLOR setStroke];
    [[INSIDE_INNER_SPACE_COLOR colorWithAlphaComponent:0.6] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextRestoreGState(context);
*/
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    [color setStroke];
    CGContextSetLineWidth(context, 1.f);
    CGContextStrokeEllipseInRect(context, CGRectMake(1.f, 1.f, CGRectGetWidth(rect)-2.f, CGRectGetHeight(rect)-2.f));
    
    CGContextRestoreGState(context);
}

