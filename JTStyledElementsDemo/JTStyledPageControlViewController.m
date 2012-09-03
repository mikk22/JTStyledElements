//
//  JTStyledPageControlViewController.m
//  JTStyledElements
//
//  Created by Mihail Koltsov on 9/3/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import "JTStyledPageControlViewController.h"


@interface JTStyledPageControlViewController ()
-(void)_layoutViews;
-(void)_setupPageControl;
-(void)_setupSegmentedControl;
-(void)_segmentedControlIndexChanged:(id)sender;
@end

@implementation JTStyledPageControlViewController

@synthesize pageControl=_pageControl;
@synthesize segmentedControl=_segmentedControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _setupPageControl];
    [self _setupSegmentedControl];
    
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pageControl=nil;
    self.segmentedControl=nil;
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
    self.pageControl.frame=CGRectMake(10.f, CGRectGetMidY(self.view.bounds), CGRectGetWidth(self.view.bounds)-2*10.f, 2.f);
    self.segmentedControl.frame=CGRectMake(10.f, CGRectGetMaxY(self.pageControl.frame)+30.f, CGRectGetWidth(self.view.bounds)-2*10.f, 40.f);
    
}



-(void)_setupPageControl
{
	self.pageControl = [[JTStyledPageControl alloc] initWithFrame:CGRectZero] ;
	[self.pageControl setNumberOfPages: 3] ;
	[self.pageControl setCurrentPage: 0] ;
	[self.pageControl setDefersCurrentPageDisplay: YES] ;

	[self.view addSubview: self.pageControl] ;
}



-(void)_setupSegmentedControl
{
    self.segmentedControl=[[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"1",@"2", @"3", nil]];
     self.segmentedControl.selectedSegmentIndex=0;

    [self.segmentedControl addTarget:self action:@selector(_segmentedControlIndexChanged:) forControlEvents:UIControlEventValueChanged];    
    
    
    [self.view addSubview:self.segmentedControl];
}


#pragma mark - SegmentedControl Touches -


-(void)_segmentedControlIndexChanged:(id)sender
{
    self.pageControl.currentPage=self.segmentedControl.selectedSegmentIndex;
	[self.pageControl updateCurrentPageDisplay];
}



@end
