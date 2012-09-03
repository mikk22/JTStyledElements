//
//  JTCircullarScrollView.h
//  ImageViewer
//
//  Created by Mihail Koltsov on 5/17/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTPagedView;

@protocol JTPagedViewDelegate <UIScrollViewDelegate>
@optional
- (void)pagedView:(JTPagedView *)pagedView pageIndex:(NSInteger)index;
- (void)pagedView:(JTPagedView *)pagedView didMoveToPageIndex:(NSInteger)index;
@end

@protocol JTPagedViewDatasource <NSObject>
- (NSInteger)numberOfViewsInPagedView:(JTPagedView *)pagedView;
- (UIView*)pagedView:(JTPagedView *)pagedView viewForIndex:(NSInteger)index;
@end

@interface JTPagedView : UIScrollView <UIScrollViewDelegate, UIGestureRecognizerDelegate>
{
    __weak  id<JTPagedViewDatasource>       _dataSource;
    __weak  id<JTPagedViewDelegate>         _pagedViewDelegate;

    BOOL                                    _continuousScroll;
    NSInteger                               _pagesCount;
	NSInteger                               _currentPage;
    UISwipeGestureRecognizerDirection       _swipeDirection;
    //real page index
}

@property (nonatomic, weak)         id<JTPagedViewDatasource>           dataSource;
@property (nonatomic, weak)         id<JTPagedViewDelegate>             delegate;

@property (nonatomic)               BOOL                                continuousScroll;
@property (nonatomic)               NSInteger                           currentPage;
@property (nonatomic, readonly)     NSInteger                           pagesCount;
@property (nonatomic, readonly)     UISwipeGestureRecognizerDirection   swipeDirection;

-(void)reloadData;

- (UIView *)viewForPageAtIndex:(NSUInteger)index;
- (UIView *)dequeueReusableViewWithTag:(NSInteger)tag;

-(void)setCurrentPage:(NSInteger)currentPage animated:(BOOL)animated;

-(void)nextPage;
-(void)previousPage;
-(void)firstPage;
-(void)lastPage;
-(void)switchToPage:(NSNumber*)pageNumber;

@end



