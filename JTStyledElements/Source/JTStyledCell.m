//
//  JTStyledCell.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledCell.h"
#import "JTStyledDefines.h"
#import "JTStyledView.h"

@implementation JTStyledCell

@synthesize layoutStyle=_layoutStyle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectedBackgroundView=[JTStyledView darkGradientView];
        self.backgroundView=[JTStyledView lightGradientView];
        self.contentView.backgroundColor=[UIColor clearColor];

        self.textLabel.textColor=[UIColor whiteColor];
        self.textLabel.highlightedTextColor = [UIColor whiteColor];
        self.textLabel.backgroundColor=[UIColor clearColor];
        self.textLabel.font=METRO_DEFAULT_FONT;
        
        self.detailTextLabel.textColor=[UIColor whiteColor];
        self.detailTextLabel.highlightedTextColor=[UIColor whiteColor];
        self.detailTextLabel.backgroundColor=[UIColor clearColor];
        self.detailTextLabel.font=METRO_DEFAULT_FONT;
        
        switch (style)
        {
            case UITableViewCellStyleValue1:
            {
                self.textLabel.textAlignment=UITextAlignmentLeft;
                self.detailTextLabel.textAlignment=UITextAlignmentRight;
                break;
            }    
            default:
            {
                self.textLabel.textAlignment=UITextAlignmentCenter;
                self.detailTextLabel.textAlignment=UITextAlignmentRight;
                break;
            }
        }
        
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //dirty hack for fullscreen cell width
    if (!CGRectIsEmpty(self.superview.bounds))
    {
        self.backgroundView.frame=CGRectMake(0, 0, CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.backgroundView.frame));
        self.selectedBackgroundView.frame=CGRectMake(0, 0, CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.backgroundView.frame));
        self.contentView.frame=CGRectMake(0, 0, CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.backgroundView.frame));
    }
    
    CGRect backgroundViewFrame=self.backgroundView.bounds;
    
    //resizing with JTStyledCell bounds
    switch (self.layoutStyle)
    {
        case JTMetroCellLayoutStylePlain:
        {
            backgroundViewFrame=CGRectMake(METRO_CELL_LEFT_OFFSET,
                                           0.f,
                                           CGRectGetWidth(backgroundViewFrame)-2*METRO_CELL_LEFT_OFFSET,
                                           CGRectGetHeight(backgroundViewFrame)-0.5f
                                           );
            break;
        }
        case JTMetroCellLayoutStyleBordered:
        default:
        {
            backgroundViewFrame=CGRectMake(METRO_CELL_LEFT_OFFSET,
                                           METRO_CELL_TOP_OFFSET,
                                           CGRectGetWidth(backgroundViewFrame)-2*METRO_CELL_LEFT_OFFSET,
                                           CGRectGetHeight(backgroundViewFrame)-2*METRO_CELL_TOP_OFFSET
                                           );
            break;
        }
    }
    
    self.backgroundView.frame=backgroundViewFrame;
    self.selectedBackgroundView.frame=backgroundViewFrame;
    self.contentView.frame=backgroundViewFrame;
    
    CGRect textlabelFrame=self.textLabel.frame;
    textlabelFrame.size.height=CGRectGetHeight(self.contentView.bounds);
    self.textLabel.frame=textlabelFrame;
    CGRect detailTextlabelFrame=self.detailTextLabel.frame;
    detailTextlabelFrame.size.height=CGRectGetHeight(self.contentView.bounds);
    self.detailTextLabel.frame=detailTextlabelFrame;
}

#pragma mark - Properties -

-(void)setLayoutStyle:(JTMetroCellLayoutStyle)layoutStyle
{
    _layoutStyle=layoutStyle;
    
    switch (layoutStyle)
    {
        case JTMetroCellLayoutStylePlain:
        {
            self.selectedBackgroundView=[JTStyledView darkView];
            self.backgroundView=[JTStyledView lightView];
            break;
        }
        case JTMetroCellLayoutStyleBordered:
        default:
        {
            self.selectedBackgroundView=[JTStyledView darkGradientView];
            self.backgroundView=[JTStyledView lightGradientView];
            break;
        }
    }

    [self setNeedsLayout];
}



@end
