//
//  JTStyledBarViewViewController.h
//  JTStyledElementsDemo
//
//  Created by user on 26.10.12.
//  Copyright (c) 2012 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTPopupGridView.h"

@interface JTStyledBarViewViewController : UIViewController <GMGridViewDataSource, GMGridViewActionDelegate>
{
    JTPopupView         *_topArrowView;
    JTPopupView         *_leftArrowView;
    JTPopupGridView     *_popupGridView;
}

@property (nonatomic, strong)   JTPopupView             *topArrowView;
@property (nonatomic, strong)   JTPopupView             *leftArrowView;
@property (nonatomic, strong)   JTPopupGridView         *popupGridView;

@end
