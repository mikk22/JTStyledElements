//
//  JTStyledCell.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledCell.h"

@implementation JTStyledCell

@synthesize layoutStyle=_layoutStyle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectedBackgroundView=[[JTStyledView alloc] initWithFrame:CGRectZero];
        self.backgroundView=[[JTStyledView alloc] initWithFrame:CGRectZero];
        self.backgroundView.backgroundColor=[UIColor clearColor];
        self.contentView.backgroundColor=[UIColor clearColor];

        self.textLabel.textColor=[UIColor whiteColor];
        self.textLabel.highlightedTextColor = [UIColor whiteColor];
        self.textLabel.backgroundColor=[UIColor clearColor];
        self.textLabel.font=METRO_DEFAULT_FONT;
        
        self.detailTextLabel.textColor=[UIColor whiteColor];
        self.detailTextLabel.highlightedTextColor=[UIColor whiteColor];
        self.detailTextLabel.backgroundColor=[UIColor clearColor];
        self.detailTextLabel.font=METRO_DEFAULT_FONT;
        
        self.backgroundView.backgroundColor=[UIColor whiteColor];        
        
        switch (style) {
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



#pragma mark - Properties -


-(void)setLayoutStyle:(JTMetroCellLayoutStyle)layoutStyle
{
    _layoutStyle=layoutStyle;
    [self setNeedsLayout];
}



/*
-(void)setBackgroundView:(JTMetroView *)backgroundView
{
    super.backgroundView=backgroundView;
}


-(JTMetroView*)backgroundView
{
    return (JTMetroView*)super.backgroundView;
}
*/





-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect backgroundViewFrame=self.backgroundView.frame;
 
    switch (self.layoutStyle)
    {
        case JTMetroCellLayoutStylePlain:
        {
            backgroundViewFrame.size.height=backgroundViewFrame.size.height-0.5f;
            break;
        }
        case JTMetroCellLayoutStyleGrouped:
        default:
            break;
    }
    
    self.contentView.frame=backgroundViewFrame;
    self.backgroundView.frame=backgroundViewFrame;
    self.selectedBackgroundView.frame=backgroundViewFrame;
}



@end
