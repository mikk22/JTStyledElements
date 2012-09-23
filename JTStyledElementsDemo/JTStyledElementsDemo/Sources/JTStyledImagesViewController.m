//
//  JTStyledImagesViewController.m
//  JTStyledElementsDemo
//
//  Created by user on 23.09.12.
//  Copyright (c) 2012 user. All rights reserved.
//

#import "JTStyledImagesViewController.h"

@interface JTStyledImagesViewController ()

@end

@implementation JTStyledImagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIImage *noPhotoImageIphone=[UIImage noPhotoImageWithSize:CGSizeMake(80.f, 80.f)];
    UIImageView *noPhotoImageView=[[UIImageView alloc] initWithImage:noPhotoImageIphone];
    noPhotoImageView.frame=CGRectMake(20.f, 20.f, 80.f, 80.f);
    [self.view addSubview:noPhotoImageView];
    
    UIImage *addPhotoImageIpad=[UIImage addPhotoImageWithSize:CGSizeMake(200.f, 200.f)];
    UIImageView *addPhotoImageView=[[UIImageView alloc] initWithImage:addPhotoImageIpad];
    addPhotoImageView.frame=CGRectMake(20.f, 120.f, 200.f, 200.f);
    [self.view addSubview:addPhotoImageView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
