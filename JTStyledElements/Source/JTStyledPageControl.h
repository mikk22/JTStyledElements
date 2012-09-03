//
//  JTAnimatedView.h
//  Viewer
//
//  Created by Mihail Koltsov on 8/13/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//
//  Based On DDPageControl
//  Created by Damien DeVille
//
//

#import <UIKit/UIKit.h>

@interface JTStyledPageControl : UIControl 
{
    NSArray     *_onColors;
    NSArray     *_offColors;
	NSInteger   _numberOfPages ;
	NSInteger   _currentPage ;
}

@property(nonatomic) NSInteger numberOfPages ;
@property(nonatomic) NSInteger currentPage ;

@property(nonatomic) BOOL hidesForSinglePage ;
@property(nonatomic) BOOL defersCurrentPageDisplay ;
@property (nonatomic) CGFloat indicatorSpace ;

@property (nonatomic,strong) NSArray *onColors ;
@property (nonatomic,strong) NSArray *offColors ;


- (void)updateCurrentPageDisplay ;


@end

