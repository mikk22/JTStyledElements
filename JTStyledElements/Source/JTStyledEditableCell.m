//
//  JTStyledEditableCell.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/26/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledEditableCell.h"
#import "JTStyledDefines.h"

@implementation JTStyledEditableCell

@synthesize textField=_textField;

-(void)dealloc
{
    self.textField=nil;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;        
        self.textField=[[JTStyledTextField alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.textField];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame=CGRectZero;
    
    switch (self.layoutStyle)
    {
        case JTMetroCellLayoutStylePlain:
        {
            self.textField.frame=self.contentView.bounds;
            break;
        }
        case JTMetroCellLayoutStyleGrouped:
        default:
        {
            self.textField.frame=CGRectMake(METRO_CELL_LEFT_OFFSET,
                                            METRO_CELL_TOP_OFFSET,
                                            CGRectGetWidth(self.contentView.frame)-2*METRO_CELL_LEFT_OFFSET,
                                            CGRectGetHeight(self.contentView.frame)-2*METRO_CELL_TOP_OFFSET);
            break;
        }
    }
    
}






-(void)setLayoutStyle:(JTMetroCellLayoutStyle)layoutStyle
{
    switch (layoutStyle)
    {
        case JTMetroCellLayoutStylePlain:
        {
            self.textField.editingMetroStyleColors=METRO_DARK_COLORS;
            self.textField.metroStyleColors=METRO_LIGHT_COLORS;
            break;
        }
        case JTMetroCellLayoutStyleGrouped:
        default:
        {
            self.textField.editingMetroStyleColors=METRO_DARK_GRADIENT_COLORS;
            self.textField.metroStyleColors=METRO_LIGHT_GRADIENT_COLORS;
            break;
        }
    }
    
    
    
    [super setLayoutStyle:layoutStyle];
}

@end
