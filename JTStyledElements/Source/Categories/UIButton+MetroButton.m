//
//  UIButton+MetroButton.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "UIButton+MetroButton.h"
#import "UIImage+MetroImages.h"

@implementation UIButton (MetroButton)








+(id)photoButton
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    //button.bounds=CGRectMake(0, 0, METRO_CELL_CONTENT_HEIGHT, METRO_CELL_CONTENT_HEIGHT);
    
    if (button)
    {
        [button setImage:[UIImage addPhotoImage] forState:UIControlStateNormal];
        /*  
         [button setImage:[UIImage imageNamed:@"AddPhotoButton.png"] forState:UIControlStateDisabled];
         [button setImage:[UIImage imageNamed:@"AddPhotoButton.png"] forState:UIControlStateSelected];
         [button setImage:[UIImage imageNamed:@"AddPhotoButton.png"] forState:UIControlStateHighlighted];
         */
    }
    return button;
}


@end
