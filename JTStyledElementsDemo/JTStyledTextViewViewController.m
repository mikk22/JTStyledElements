//
//  JTStyledTextViewViewController.m
//  JTStyledElements
//
//  Created by Mihail Koltsov on 9/4/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import "JTStyledTextViewViewController.h"

#define OFFSET  10.f

@interface JTStyledTextViewViewController ()
-(void)_layoutViews;
-(void)_setupTextView;
@end

@implementation JTStyledTextViewViewController

@synthesize textView=_textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self _setupTextView];
    
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.textView=nil;
}

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

-(void)_layoutViews
{
    self.textView.frame=CGRectMake(OFFSET, OFFSET, CGRectGetWidth(self.view.bounds)-2*OFFSET, 100.f);
}

-(void)_setupTextView
{
    self.textView=[[JTStyledTextView alloc] initWithFrame:CGRectZero];
    self.textView.layer.cornerRadius = 0.0f;
    self.textView.layer.masksToBounds = YES;
    self.textView.font=[UIFont fontWithName:@"Helvetica-Oblique" size:12.f];
    self.textView.placeholder=NSLocalizedString(@"[Enter text]", nil);
    [self.textView setReturnKeyType:UIReturnKeyDone];
    
    [self.view addSubview:self.textView];

}

@end
