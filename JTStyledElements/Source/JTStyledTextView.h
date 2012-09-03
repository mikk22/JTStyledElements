//
//  JTStyledTextView.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 5/25/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAX_SYMBOLS_COUNT   150


@interface JTStyledTextView : UITextView
{
    NSString *_placeholder;
    UIColor *_placeholderColor;
    
@private
    UILabel *_placeHolderLabel;
    UILabel *_symbolsRestLabel;
}

@property (nonatomic, strong) UILabel *placeHolderLabel;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, strong) UILabel   *symbolsRestLabel;


-(void)textChanged:(NSNotification*)notification;
-(void)_trimSymbols;

@end
