//
//  JTStyledEditableCell.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/26/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import "JTStyledCell.h"
#import "JTStyledTextField.h"

@interface JTStyledEditableCell : JTStyledCell
{
    JTStyledTextField     *_textField;
}

@property (nonatomic, strong)   JTStyledTextField *textField;



@end
