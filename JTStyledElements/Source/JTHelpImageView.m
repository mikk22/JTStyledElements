//
//  JTHelpImageView.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/16/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#define HELP_ANIMATION_SHOW_TIME    1.f

#import "JTHelpImageView.h"

@interface JTHelpImageView()
{
    NSString    *_helpKey;
}

@property (nonatomic, copy) NSString    *helpKey;

@end


@implementation JTHelpImageView

@synthesize helpKey=_helpKey;


+(BOOL)needToShowHelpViewForKey:(NSString*)helpKey
{
    return ![[NSUserDefaults standardUserDefaults] boolForKey:helpKey];
}


-(void)dealloc
{
    self.helpKey=nil;
}



- (id)initWithHelpKey:(NSString*)helpKey
{
    NSString *helpKeyImageName=[helpKey stringByAppendingString:@".png"];
    UIImage *image=[UIImage imageNamed:helpKeyImageName];
    self=[super initWithImage:image];
    if (self)
    {
        self.helpKey=helpKey;
        self.userInteractionEnabled=YES;        
        UITapGestureRecognizer  *tapRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideHelper:)];
        tapRecognizer.numberOfTapsRequired=1;
        tapRecognizer.numberOfTouchesRequired=1;
        [self addGestureRecognizer:tapRecognizer];
    }
    
    return self;
}





-(void)hideHelper:(UITapGestureRecognizer*)tapGestureRecognizer
{
    tapGestureRecognizer.view.alpha=1.f;
    [UIView animateWithDuration:HELP_ANIMATION_SHOW_TIME animations:^
     {
         tapGestureRecognizer.view.alpha=0.f;
         
     } completion:^(BOOL finished)
     {
         [tapGestureRecognizer.view removeFromSuperview];
         [[NSUserDefaults standardUserDefaults] setBool:YES forKey:self.helpKey];
     }];    
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.alpha=0.f;
    [UIView animateWithDuration:HELP_ANIMATION_SHOW_TIME animations:^
     {
         self.alpha=1.f;
     }
     ];    
}


@end
