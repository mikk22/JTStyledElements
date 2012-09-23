//
//  JTStyledTextViewViewController.h
//  JTStyledElements
//
//  Created by Mihail Koltsov on 9/4/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTStyledElements.h"

@interface JTStyledTextViewViewController : UIViewController
{
    JTStyledTextView    *_textView;
}

@property (nonatomic, strong)   JTStyledTextView    *textView;

@end
