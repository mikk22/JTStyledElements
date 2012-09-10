//
//  JTStyledCell.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//


typedef enum
{
    JTMetroCellLayoutStyleBordered=0,
    JTMetroCellLayoutStylePlain,
} JTMetroCellLayoutStyle;


#import <UIKit/UIKit.h>

@class JTStyledView;

@interface JTStyledCell : UITableViewCell
{
    JTMetroCellLayoutStyle        _layoutStyle;
}

@property (nonatomic)           JTMetroCellLayoutStyle    layoutStyle;

@end
