//
//  JTAppDelegate.h
//  JTStyledElementsDemo
//
//  Created by Mihail Koltsov on 9/3/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTViewController;

@interface JTAppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController      *_navigationController;
}

@property (strong, nonatomic) UIWindow                  *window;
@property (strong, nonatomic) UINavigationController    *navigationController;

@end
