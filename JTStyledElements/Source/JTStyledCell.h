//
//  JTStyledCell.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//


typedef enum
{
    JTMetroCellLayoutStyleGrouped=0,
    JTMetroCellLayoutStylePlain=1
} JTMetroCellLayoutStyle;


#import <UIKit/UIKit.h>


@interface JTStyledCell : UITableViewCell
{
    JTMetroCellLayoutStyle        _layoutStyle;
}


//@property (nonatomic, strong)   JTMetroView               *backgroundView;
@property (nonatomic)           JTMetroCellLayoutStyle    layoutStyle;

@end
