//
//  JTAnimatedView.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 8/13/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTAnimatedView : UIView
{
    UIView                      *_animatedView;
    NSUInteger                  _animationDuration;
    UIViewAnimationTransition   _animationTransition;
}

@property (nonatomic, strong)     UIView                    *animatedView;
@property (nonatomic, readwrite)  NSUInteger                animationDuration;
@property (nonatomic)             UIViewAnimationTransition animationTransition;

- (id)initWithAnimatedView:(UIView*)animatedView;

-(void)setAnimatedView:(UIView *)animatedView animated:(BOOL)animated;

@end
