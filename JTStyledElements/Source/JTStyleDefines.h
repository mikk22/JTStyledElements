//
//  JTStyleDefines.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/24/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#define METRO_WHITE_START_COLOR             [UIColor colorForHex:@"f4f4f4"]
#define METRO_WHITE_END_COLOR               [UIColor colorForHex:@"f7f7f7"]

#define METRO_DARK_START_COLOR              [UIColor colorForHex:@"404040"]
#define METRO_DARK_END_COLOR                [UIColor colorForHex:@"595959"]

#define METRO_LIGHT_START_COLOR             [UIColor colorForHex:@"b6b6b6"]
#define METRO_LIGHT_END_COLOR               [UIColor colorForHex:@"bfbfbf"]

#define METRO_DARK_COLOR                    [UIColor colorForHex:@"6f6f6f"]
#define METRO_LIGHT_COLOR                   [UIColor colorForHex:@"Ababab"]

#define METRO_LIGHT_GRADIENT_COLORS         [NSArray arrayWithObjects:METRO_LIGHT_START_COLOR,METRO_LIGHT_END_COLOR, nil]
#define METRO_DARK_GRADIENT_COLORS          [NSArray arrayWithObjects:METRO_DARK_START_COLOR,METRO_DARK_END_COLOR, nil]
#define METRO_LIGHT_COLORS                  [NSArray arrayWithObjects:METRO_LIGHT_COLOR,METRO_LIGHT_COLOR, nil]
#define METRO_DARK_COLORS                   [NSArray arrayWithObjects:METRO_DARK_COLOR,METRO_DARK_COLOR, nil]

#define METRO_SMALL_FONT                  [UIFont fontWithName:@"HeliosCompressed" size:14]
#define METRO_DEFAULT_FONT                  [UIFont fontWithName:@"HeliosCompressed" size:18]
#define METRO_TITLE_FONT                    [UIFont fontWithName:@"HeliosCompressed" size:24]
#define METRO_BUTTON_HEIGHT                 30.f


#define METRO_CELL_CONTENT_HEIGHT           36.f
#define METRO_CELL_HEIGHT                   (METRO_CELL_CONTENT_HEIGHT+2*METRO_CELL_TOP_OFFSET)

#define METRO_CELL_LEFT_OFFSET              7.f
#define METRO_CELL_TOP_OFFSET               (METRO_CELL_LEFT_OFFSET/2)


#define METRO_TEXTLABEL_LEFT_OFFSET         12.f

#define PHOTO_VIEW_CELL_TEXTLABEL_HEIGHT    31.f


#import "JTStyledCell.h"
#import "JTStyledPageControl.h"
#import "JTStyledTextField.h"
#import "JTStyledTextView.h"
#import "JTStyledTimeLineView.h"
#import "JTStyledView.h"
#import "JTStyledArrowView.h"
#import "JTStyledButton.h"
#import "JTButton+MetroButton.h"