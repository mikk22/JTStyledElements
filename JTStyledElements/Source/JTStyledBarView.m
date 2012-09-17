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
    /*
    self.barView.frame=CGRectMake(METRO_ARROWVIEW_ARROW_WIDTH+METRO_CELL_TOP_OFFSET,
                                  METRO_CELL_TOP_OFFSET,
                                  CGRectGetWidth(self.bounds)-METRO_ARROWVIEW_ARROW_WIDTH-2*METRO_CELL_TOP_OFFSET,
                                  CGRectGetHeight(self.bounds)-2*METRO_CELL_TOP_OFFSET);
    */
    self.barView.frame=CGRectMake(METRO_ARROWVIEW_ARROW_WIDTH+METRO_CELL_TOP_OFFSET,
                                  0.f,
                                  CGRectGetWidth(self.bounds)-METRO_ARROWVIEW_ARROW_WIDTH-2*METRO_CELL_TOP_OFFSET,
                                  CGRectGetHeight(self.bounds));
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
