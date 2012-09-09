//
//  JTStyledPagedView.m
//  Devisa
//
//  Created by user on 09.09.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledBarView.h"

@implementation JTStyledBarView

@synthesize barView=_barView;

-(void)dealloc
{
    self.barView=nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.barView=[[JTBarView alloc] initWithFrame:frame];
        self.barView.backgroundColor=[UIColor clearColor];
        [self addSubview:self.barView];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.barView.frame=CGRectMake(METRO_ARROWVIEW_ARROW_WIDTH+5, 5, CGRectGetWidth(self.bounds)-METRO_ARROWVIEW_ARROW_WIDTH-2*5, CGRectGetHeight(self.bounds)-2*5);
}

#pragma mark - Properties -

-(void)setDelegate:(id<JTBarViewDelegate>)delegate
{
    self.barView.barDelegate=delegate;
}

-(id<JTBarViewDelegate>)delegate
{
    return self.barView.barDelegate;
}

-(void)setDataSource:(id<JTBarViewDataSource>)dataSource
{
    self.barView.barDataSource=dataSource;
}

-(id<JTBarViewDataSource>)dataSource
{
    return self.barView.barDataSource;
}

@end
