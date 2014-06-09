//
//  MasterViewController.h
//  Sample
//
//  Created by Jose Rafael Leon Bigio Anton on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNSegmentedControl.h"

@interface MasterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,DZNSegmentedControlDelegate>

@property (nonatomic, strong) DZNSegmentedControl *control;
@property (nonatomic, retain)  UITableView *tableView;
@property (nonatomic, strong) NSArray *menuItems;

@end
