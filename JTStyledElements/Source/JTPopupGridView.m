//
//  JTPopupGridView.m
//  Devisa
//
//  Created by user on 09.09.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTPopupGridView.h"

@implementation JTPopupGridView

@synthesize gridView=_gridView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.gridView=[[GMGridView alloc] initWithFrame:CGRectZero];
        self.gridView.clipsToBounds=YES;
        self.gridView.backgroundColor=[UIColor clearColor];
        self.gridView.minEdgeInsets=UIEdgeInsetsMake(METRO_CELL_TOP_OFFSET, METRO_CELL_TOP_OFFSET, METRO_CELL_TOP_OFFSET, METRO_CELL_TOP_OFFSET);
        self.gridView.itemSpacing=METRO_CELL_TOP_OFFSET;
        self.gridView.centerGrid = NO;
        self.gridView.layoutStrategy = [GMGridViewLayoutStrategyFactory strategyFromType:GMGridViewLayoutHorizontal];
        [self addSubview:self.gridView];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.gridView.frame=self.bounds;
}

@end
