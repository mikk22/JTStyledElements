//
//  JTAnimatedView.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 8/13/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledPageControl.h"
#import "UIColor+AdvancedColors.h"

#define DEFAULT_INDICATOR_SPACE_SIZE    3.f

@implementation JTStyledPageControl

@synthesize numberOfPages=_numberOfPages;
@synthesize currentPage=_currentPage ;

@synthesize hidesForSinglePage ;
@synthesize defersCurrentPageDisplay ;

@synthesize indicatorSpace;

@synthesize onColors=_onColors ;
@synthesize offColors=_offColors ;

#pragma mark - Initializers - dealloc

- (void)dealloc
{
	self.onColors = nil ;
	self.offColors = nil ;
}


- (id)init
{
	self = [self initWithFrame: CGRectZero] ;
	return self ;
}

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame: CGRectZero]))
	{
		self.backgroundColor = [UIColor clearColor] ;
        self.contentMode=UIViewContentModeRedraw;
        self.indicatorSpace=DEFAULT_INDICATOR_SPACE_SIZE;
	}
	return self ;
}

- (void)drawRect:(CGRect)rect
{
	// get the current context
	CGContextRef context = UIGraphicsGetCurrentContext() ;
	// save the context
	CGContextSaveGState(context) ;
	// allow antialiasing
	CGContextSetAllowsAntialiasing(context, TRUE) ;
	
	// geometry
	CGRect currentBounds = self.bounds ;
    CGFloat length= CGRectGetWidth(currentBounds)/self.numberOfPages-indicatorSpace/(self.numberOfPages-1);
	CGFloat y = 0;
    
    UIColor *drawOnStartColor=[self.onColors objectAtIndex:0];
    UIColor *drawOnEndColor=[self.onColors objectAtIndex:1];
    UIColor *drawOffStartColor=[self.offColors objectAtIndex:0];
    UIColor *drawOffEndColor=[self.offColors objectAtIndex:1];
    
	// actually draw the dots
	for (int i = 0 ; i < self.numberOfPages ; i++)
	{
        CGFloat x = (length+indicatorSpace)*i;
		CGRect dotRect = CGRectMake(x, y, length, CGRectGetHeight(currentBounds)) ;
        
		if (i == self.currentPage)
		{
                CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
                //CGContextRef context = UIGraphicsGetCurrentContext();
                CGFloat locations[] = { 0.0, 1.0 };
                
                CGColorRef  startColor=[drawOnStartColor CGColor];
                CGColorRef  endColor=[drawOnEndColor CGColor];
                
                NSArray *colors = [NSArray arrayWithObjects:
                                   (__bridge id)startColor, 
                                   (__bridge id)endColor, nil];
                
                CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, 
                                                                    (__bridge CFArrayRef) colors, locations);
                
                CGPoint startPoint = CGPointMake(CGRectGetMidX(dotRect), CGRectGetMinY(dotRect));
                CGPoint endPoint = CGPointMake(CGRectGetMidX(dotRect), CGRectGetMaxY(dotRect));
                
                CGContextSaveGState(context);
                CGContextAddRect(context, dotRect);
                CGContextClip(context);
                CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
                CGContextRestoreGState(context);
                
                CGGradientRelease(gradient);
                CGColorSpaceRelease(colorSpace);
		}
		else
		{
			{
                CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
                //CGContextRef context = UIGraphicsGetCurrentContext();
                CGFloat locations[] = { 0.0, 1.0 };
                
                CGColorRef  startColor=[drawOffStartColor CGColor];
                CGColorRef  endColor=[drawOffEndColor CGColor];
                
                NSArray *colors = [NSArray arrayWithObjects:
                                   (__bridge id)startColor, 
                                   (__bridge id)endColor, nil];
                
                CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, 
                                                                    (__bridge CFArrayRef) colors, locations);
                
                CGPoint startPoint = CGPointMake(CGRectGetMidX(dotRect), CGRectGetMinY(dotRect));
                CGPoint endPoint = CGPointMake(CGRectGetMidX(dotRect), CGRectGetMaxY(dotRect));
                
                CGContextSaveGState(context);
                CGContextAddRect(context, dotRect);
                CGContextClip(context);
                CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
                CGContextRestoreGState(context);
                
                CGGradientRelease(gradient);
                CGColorSpaceRelease(colorSpace);
                
			}
		}
		
	}
	
	// restore the context
	CGContextRestoreGState(context) ;
}


#pragma mark - Properties -

- (void)setCurrentPage:(NSInteger)pageNumber
{
	// no need to update in that case
	if (_currentPage == pageNumber)
		return ;
	
	// determine if the page number is in the available range
	_currentPage = MIN(MAX(0, pageNumber), _numberOfPages - 1) ;
	
	// in case we do not defer the page update, we redraw the view
	if (self.defersCurrentPageDisplay == NO)
		[self setNeedsDisplay] ;
}

- (void)setNumberOfPages:(NSInteger)numOfPages
{
	// make sure the number of pages is positive
	_numberOfPages = MAX(0, numOfPages) ;
	
	// we then need to update the current page
	_currentPage = MIN(MAX(0, _currentPage), _numberOfPages - 1) ;
	
	// correct the bounds accordingly
	self.bounds = self.bounds ;
	
	// we need to redraw
	[self setNeedsDisplay] ;
	
	// depending on the user preferences, we hide the page control with a single element
	if (hidesForSinglePage && (numOfPages < 2))
		[self setHidden: YES] ;
	else
		[self setHidden: NO] ;
}

- (void)setHidesForSinglePage:(BOOL)hide
{
	hidesForSinglePage = hide ;
	
	// depending on the user preferences, we hide the page control with a single element
	if (hidesForSinglePage && (self.numberOfPages < 2))
		[self setHidden: YES] ;
}

- (void)setDefersCurrentPageDisplay:(BOOL)defers
{
	defersCurrentPageDisplay = defers ;
}


-(NSArray*)onColors
{
    if (!_onColors || _onColors.count<2 )
    {
        _onColors=[NSArray arrayWithObjects:
                   [UIColor colorForHex:@"d35252"],
                   [UIColor colorForHex:@"c90d0d"], nil];
    }
    
    return _onColors;
}


-(NSArray*)offColors
{
    if (!_offColors || _offColors.count<2 )
    {
        _offColors=[NSArray arrayWithObjects:
                    [UIColor colorForHex:@"e7e7e7"],
                    [UIColor colorForHex:@"dcdcdc"], nil];
    }
    
    return _offColors;
}



- (void)setOnColor:(NSArray *)aColors
{
	_onColors = aColors ;
	
	[self setNeedsDisplay] ;
}

- (void)setOffColor:(NSArray *)aColors
{
	_offColors = aColors ;
	
	[self setNeedsDisplay] ;
}


- (void)setIndicatorSpace:(CGFloat)aSpace
{
	indicatorSpace = aSpace ;
	
	// correct the bounds accordingly
	//self.bounds = self.bounds ;
	
	[self setNeedsDisplay] ;
}

#pragma mark -
#pragma mark UIPageControl methods

- (void)updateCurrentPageDisplay
{
	if (self.defersCurrentPageDisplay == NO)
		return ;
	
	[self setNeedsDisplay] ;
}



@end