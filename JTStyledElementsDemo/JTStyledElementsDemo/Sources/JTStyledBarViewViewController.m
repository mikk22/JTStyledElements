//
//  JTStyledBarViewViewController.m
//  JTStyledElementsDemo
//
//  Created by user on 26.10.12.
//  Copyright (c) 2012 user. All rights reserved.
//

#import "JTStyledBarViewViewController.h"

@interface JTStyledBarViewViewController ()

@end

@implementation JTStyledBarViewViewController

@synthesize topArrowView=_topArrowView;
@synthesize leftArrowView=_leftArrowView;
@synthesize popupGridView=_popupGridView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.topArrowView=[[JTPopupView alloc] initWithFrame:CGRectZero];
    self.topArrowView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:self.topArrowView];

    self.leftArrowView=[[JTPopupView alloc] initWithFrame:CGRectZero];
    self.leftArrowView.arrowStyle=JTStyledArrowViewArrowLeft;
    self.leftArrowView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:self.leftArrowView];
    
    
    self.popupGridView=[[JTPopupGridView alloc] initWithFrame:CGRectZero];
    self.popupGridView.gridView.dataSource=self;
    self.popupGridView.gridView.actionDelegate=self;
    [self.view addSubview:self.popupGridView];
}

-(void)viewWillLayoutSubviews
{
    self.topArrowView.frame=CGRectMake(100, 100, 100, 100);
    self.leftArrowView.frame=CGRectMake(100, CGRectGetMaxY(self.topArrowView.frame)+20, 100, 100);
    
    self.popupGridView.frame=CGRectMake(CGRectGetMaxX(self.topArrowView.frame)+20, 100, 400, 100);
}





//////////////////////////////////////////////////////////////
#pragma mark GMGridViewDataSource
//////////////////////////////////////////////////////////////

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return 8;
}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return CGSizeMake(80, 80);
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    GMGridViewCell *cell = [gridView dequeueReusableCell];
    
    if (!cell)
    {
        cell = [[GMGridViewCell alloc] init];
    }
    
    cell.backgroundColor=[UIColor orangeColor];
    return cell;
}

//////////////////////////////////////////////////////////////
#pragma mark GMGridViewActionDelegate
//////////////////////////////////////////////////////////////

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    NSLog(@"TAPPED");
}


@end
