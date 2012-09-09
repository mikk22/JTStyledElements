//
//  JTStyledPagedView.h
//  Devisa
//
//  Created by user on 09.09.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledArrowView.h"
#import "JTBarView.h"

@interface JTStyledBarView : JTStyledArrowView
{
    JTBarView     *_barView;
}

@property (nonatomic, strong)   JTBarView                       *barView;
@property (nonatomic, weak)     id<JTBarViewDataSource>         dataSource;
@property (nonatomic, weak)     id<JTBarViewDelegate>           delegate;


@end
