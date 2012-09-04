//
//  JTStyledButtonViewController.m
//  JTStyledElements
//
//  Created by Mihail Koltsov on 9/4/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import "JTStyledButtonViewController.h"

#define OFFSET  10.f

@interface JTStyledButtonViewController ()
-(void)_layoutViews;
-(void)_setupButtons;
@end

@implementation JTStyledButtonViewController

@synthesize gradientButton=_gradientButton;
@synthesize roundRectLightGradientButton=_roundRectLightGradientButton;
@synthesize roundRectDarkGradientButton=_roundRectDarkGradientButton;
@synthesize jtButton=_jtButton;
@synthesize inversedJTButton=_inversedJTButton;


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self _layoutViews];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self _layoutViews];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _setupButtons];
    
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.gradientButton=nil;
    self.roundRectLightGradientButton=nil;
    self.roundRectDarkGradientButton=nil;
    self.jtButton=nil;
    self.inversedJTButton=nil;
}


-(void)_layoutViews
{
    self.gradientButton.frame=CGRectMake(OFFSET,
                                         OFFSET,
                                         CGRectGetWidth(self.view.bounds)-2*OFFSET,
                                         40.f);
    
    self.roundRectLightGradientButton.frame=CGRectMake(OFFSET,
                                                       CGRectGetMaxY(self.gradientButton.frame)+OFFSET,
                                                       CGRectGetWidth(self.view.bounds)-2*OFFSET,
                                                       40.f);

    self.roundRectDarkGradientButton.frame=CGRectMake(OFFSET,
                                                       CGRectGetMaxY(self.roundRectLightGradientButton.frame)+OFFSET,
                                                       CGRectGetWidth(self.view.bounds)-2*OFFSET,
                                                       40.f);
    
    self.jtButton.frame=CGRectMake(OFFSET,
                                                      CGRectGetMaxY(self.roundRectDarkGradientButton.frame)+OFFSET,
                                                      CGRectGetWidth(self.view.bounds)-2*OFFSET,
                                                      40.f);
    
    self.inversedJTButton.frame=CGRectMake(OFFSET,
                                                      CGRectGetMaxY(self.jtButton.frame)+OFFSET,
                                                      CGRectGetWidth(self.view.bounds)-2*OFFSET,
                                                      40.f);
}



-(void)_setupButtons
{
    self.gradientButton=[JTStyledButton gradientButton];
    self.roundRectLightGradientButton=[JTStyledButton roundRectLightGradientButton];
    self.roundRectDarkGradientButton=[JTStyledButton roundRectDarkGradientButton];
    self.jtButton=[JTStyledButton jtButton];
    self.inversedJTButton=[JTStyledButton inversedJTButton];
    
    [self.view addSubview:self.gradientButton];
    [self.view addSubview:self.roundRectLightGradientButton];
    [self.view addSubview:self.roundRectDarkGradientButton];
    [self.view addSubview:self.jtButton];
    [self.view addSubview:self.inversedJTButton];
}

@end
