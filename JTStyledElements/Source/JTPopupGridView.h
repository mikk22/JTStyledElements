//
//  JTPopupGridView.h
//  Devisa
//
//  Created by user on 09.09.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTPopupView.h"
#import "JTBarView.h"
#import "JTStyledDefines.h"
#import "GMGridView.h"
#import "GMGridViewLayoutStrategies.h"

@interface JTPopupGridView : JTPopupView
{
    GMGridView     *_gridView;
}

@property (nonatomic, strong)   GMGridView                       *gridView;

@end
