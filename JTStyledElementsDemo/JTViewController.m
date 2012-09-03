//
//  JTViewController.m
//  JTStyledElements
//
//  Created by Mihail Koltsov on 9/3/12.
//  Copyright (c) 2012 Mihail Koltsov. All rights reserved.
//

#import "JTViewController.h"

#import "JTStyledPageControlViewController.h"


enum
{
    kJTStyledPageControlCell,
    kJTStyledElementsCount
};


#define JTSTYLED_ELEMENTS_ARRAY     [NSArray arrayWithObjects:@"JTStyledPageControl",nil]


@interface JTViewController ()

@end

@implementation JTViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kJTStyledElementsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text=[JTSTYLED_ELEMENTS_ARRAY objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *viewController;
    
    switch (indexPath.row)
    {
        case kJTStyledPageControlCell:
        {
            viewController=[[JTStyledPageControlViewController alloc] init];
            viewController.title=[JTSTYLED_ELEMENTS_ARRAY objectAtIndex:indexPath.row];
            break;
        }
        default:
            NSAssert(NO, @"There are no Any ViewController for this cell.");
            break;
    }
    
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
