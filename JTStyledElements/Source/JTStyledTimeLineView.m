//
//  JTStyledTimeLineView.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/28/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledTimeLineView.h"
#import "JTStyleDefines.h"

@implementation JTStyledTimeLineView

@synthesize withBall=_withBall;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.withBall=YES;
        // Initialization code
    }
    return self;
}



- (id)initWithoutBallWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.withBall=NO;
        // Initialization code
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context    = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 0.5);
    
    
    CGContextMoveToPoint(context, CGRectGetMidX(rect),0); //start at this point
    CGContextAddLineToPoint(context, CGRectGetMidX(rect), CGRectGetHeight(rect)); //draw to this point
    // and now draw the Path!
    CGContextStrokePath(context);
    
    if (self.withBall)
    {
        // Draw a solid circle
        CGContextSetRGBFillColor(context, 255, 255, 255, 1);
        CGContextFillEllipseInRect(context, CGRectMake(0, (PHOTO_VIEW_CELL_TEXTLABEL_HEIGHT)/2, 5, 5));
    }
}

@end
