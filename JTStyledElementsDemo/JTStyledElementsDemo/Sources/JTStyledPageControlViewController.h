//
//  JTStyledPageControlViewController.h
//  JTStyledElements
//
//  Created by Mihail Koltsov on 9/3/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTStyledElements.h"

@interface JTStyledPageControlViewController : UIViewController
{
    JTStyledPageControl             *_pageControl;
    UISegmentedControl              *_segmentedControl;
}

@property (nonatomic, strong)   JTStyledPageControl             *pageControl;
@property (nonatomic, strong)   UISegmentedControl              *segmentedControl;

@end
