//
//  JTStyledTimeLineView.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/28/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//
#define METRO_TIMELINEVIEW_WIDTH            5.f


#import <UIKit/UIKit.h>



@interface JTStyledTimeLineView : UIView
{
    BOOL    _withBall;
}

@property (nonatomic)   BOOL    withBall;

- (id)initWithoutBallWithFrame:(CGRect)frame;

@end
