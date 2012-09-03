//
//  JTHelpImageView.h
//  Jeetrium
//
//  Created by Mihail Koltsov on 7/16/12.
//  Copyright (c) 2012 Intelvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTHelpImageView : UIImageView

+(BOOL)needToShowHelpViewForKey:(NSString*)helpKey;

- (id)initWithHelpKey:(NSString*)helpKey;

@end
