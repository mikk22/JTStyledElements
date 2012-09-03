//
//  JTAnimatedView.m
//  Viewer
//
//  Created by Mihail Koltsov on 8/13/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTAnimatedView.h"

@interface JTAnimatedView()
{
    NSNumber        *_isAnimating;
}
@end

@implementation JTAnimatedView

@synthesize animatedView=_animatedView;
@synthesize animationDuration=_animationDuration;
@synthesize animationTransition=_animationTransition;

-(void)dealloc
{
    _animatedView=nil;
    _isAnimating=nil;
}


-(id)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if (self)
    {
        //self.contentMode=UIViewContentModeRedraw;
        self.animationDuration=1.5;
        self.animationTransition=UIViewAnimationTransitionNone;
        self.backgroundColor=[UIColor clearColor];
    }
    
    return self;
}

- (id)initWithAnimatedView:(UIView*)animatedView;
{
    self = [super initWithFrame:CGRectZero];
    if (self)
    {
        _animatedView=animatedView;
        [self addSubview:_animatedView];
    }
    return self;
}



-(void)layoutSubviews
{
    if (!_isAnimating)
    {
        [super layoutSubviews];
        self.animatedView.frame=CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    }
}



-(void)setAnimatedView:(UIView *)animatedView
{
    [_animatedView removeFromSuperview];
    _animatedView=animatedView;
    [self addSubview:_animatedView];
    [self setNeedsLayout];
}




-(void)setAnimatedView:(UIView *)animatedView animated:(BOOL)animated
{
    UIView *oldAnimatedView=_animatedView;
    _animatedView=animatedView;

    if ( ((self.animationTransition==UIViewAnimationTransitionFlipFromLeft) || (self.animationTransition==UIViewAnimationTransitionFlipFromRight))
            && self.animationDuration!=0 && animated)
    {
        //
        //initial position
        //
        //oldAnimatedView.frame=CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        //oldAnimatedView.alpha=1.f;
        switch (self.animationTransition)
        {
            case UIViewAnimationTransitionFlipFromRight:
            {
                _animatedView.frame=CGRectMake(CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
                break;
            }    
            case UIViewAnimationTransitionFlipFromLeft:
            {
                _animatedView.frame=CGRectMake(-CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
                break;
            }    
            default:
                break;
        }
        
        [self addSubview:_animatedView];
        
        _isAnimating=[NSNumber numberWithBool:YES];
        [UIView animateWithDuration:self.animationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             /*
             switch (self.animationTransition)
             {
                 case UIViewAnimationTransitionFlipFromRight:
                 {
                     oldAnimatedView.frame=CGRectMake(-CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
                     break;
                 }    
                 case UIViewAnimationTransitionFlipFromLeft:
                 {
                     oldAnimatedView.frame=CGRectMake(CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
                     break;
                 }    
                 default:
                     break;
                
             }
             */
             oldAnimatedView.alpha=0.0f;
             _animatedView.frame=CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
         } 
        completion:^(BOOL finished)
         {
             
             [oldAnimatedView removeFromSuperview];
             //_isAnimating=nil;
         }];
    } else
    {
        _isAnimating=nil;
        [oldAnimatedView removeFromSuperview];
        [self addSubview:_animatedView];
        [self setNeedsLayout];
    }
}



@end
