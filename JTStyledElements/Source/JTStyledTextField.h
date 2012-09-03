//
//  JTMetroTextField.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/24/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTStyleDefines.h"
#import "UIColor+AdvancedColors.h"

@interface JTStyledTextField : UITextField
{
    NSArray *_metroStyleColors;
    NSArray *_editingMetroStyleColors;
    CAGradientLayer *_gradientLayer;
}

@property (nonatomic, strong)   NSArray *metroStyleColors;
@property (nonatomic, strong)   NSArray *editingMetroStyleColors;




@end
