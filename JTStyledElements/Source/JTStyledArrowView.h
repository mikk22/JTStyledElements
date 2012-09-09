//
//  JTMetroArrowView.h
//  Jeetrium
//
//  Created by user on 02.06.12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+AdvancedColors.h"

#define METRO_ARROWVIEW_ARROW_LEFT_OFFSET   23
#define METRO_ARROWVIEW_ARROW_WIDTH         7.f
#define METRO_ARROWVIEW_ARROW_HEIGHT        8.f

typedef enum
{
    JTStyledArrowViewArrowTop=0,
    JTStyledArrowViewArrowLeft
} JTStyledArrowViewArrowPosition;

@interface JTStyledArrowView : UIView
{
    UIColor                             *_fillColor;
    NSArray                             *_metroStyleColors;
    JTStyledArrowViewArrowPosition      _arrowStyle;
}

@property (nonatomic, strong)   UIColor                             *fillColor;
@property (nonatomic, strong)   NSArray                             *metroStyleColors;
@property (nonatomic)           JTStyledArrowViewArrowPosition      arrowStyle;


//+ (void)roundedLayer:(CALayer *)viewLayer;

@end
