//
//  JTButtonsBarView.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 6/15/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "JTStyledDefines.h"

//#define BAR_BUTTON_TITLE_HEIGHT 15.f

typedef enum
{
    JTButtonsBarHorizontalStyle=0,
    JTButtonsBarVerticalStyle=1
} JTButtonsBarStyle;


@protocol JTBarViewDelegate;
@protocol JTBarViewDataSource;


@interface JTBarView : UIScrollView
{
    __weak  id<JTBarViewDataSource>  _barDataSource;
    __weak  id<JTBarViewDelegate>    _barDelegate;
    
    BOOL                                    _initialized;
    NSUInteger                              _buttonsCount;
    JTButtonsBarStyle                       _barStyle;
    CGFloat                                 _horizontalOffset;
    CGFloat                                 _verticalOffset;
    CGSize                                  _barButtonSize;
    
    BOOL                                    _allowsMultipleSelection;
    BOOL                                    _centerContent;
    NSArray                                 *_selectedIndexes;
}

@property (nonatomic, weak)     id<JTBarViewDataSource>          barDataSource;
@property (nonatomic, weak)     id<JTBarViewDelegate>            barDelegate;


@property (nonatomic)           JTButtonsBarStyle                       barStyle;
@property (nonatomic)           CGFloat                                 horizontalOffset;
@property (nonatomic)           CGFloat                                 verticalOffset;
@property (nonatomic)           CGSize                                  barButtonSize;

@property (nonatomic)           BOOL                                    allowsMultipleSelection;
@property (nonatomic)           BOOL                                    centerContent;
@property (nonatomic, readonly) NSDictionary                            *buttons;
@property (nonatomic, readonly) NSArray                                 *allButtons;
@property (nonatomic, strong)   NSArray                                 *selectedIndexes;


- (id)initWithStyle:(JTButtonsBarStyle)style;
- (UIControl*)buttonAtIndexPath:(NSIndexPath*)indexPath;
- (void)reloadData;
- (void)resetSelection;

@end




@protocol JTBarViewDataSource <NSObject>
@required   
    - (NSInteger)numberOfSectionsInBarView:(JTBarView *)barView;
    - (NSInteger)numberOfItemsInBarView:(JTBarView *)barView forSection:(NSUInteger)section;
    - (UIView*)barView:(JTBarView *)barView itemForIndexPath:(NSIndexPath*)indexPath;
@end




@protocol JTBarViewDelegate <UIScrollViewDelegate>
@optional
- (void)barView:(JTBarView *)barView button:(UIControl*)controlButton forIndexPathTouched:(NSIndexPath*)indexPath;
- (void)barViewSelectionChanged:(JTBarView *)barView;
@end








