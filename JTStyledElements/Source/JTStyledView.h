//
//  JTMetroView.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/24/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+AdvancedColors.h"
#import "JTStyleDefines.h"

@interface JTStyledView : UIView
{
    NSArray *_metroStyleColors;
}

@property (nonatomic, strong)   NSArray *metroStyleColors;


+(id)darkGradientView;
+(id)lightGradientView;



@end
