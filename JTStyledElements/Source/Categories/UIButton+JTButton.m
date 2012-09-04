//
//  UIButton+JTButton.m
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/23/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "UIButton+JTButton.h"
#import "UIImage+JTImages.h"

@implementation UIButton (JTButton)








+(id)photoButton
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if (button)
    {
        [button setImage:[UIImage addPhotoImage] forState:UIControlStateNormal];
    }
    return button;
}


@end
