//
//  SegmentViewController.h
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <Parse/Parse.h>
#import "MasterViewController.h"

@interface SegmentViewController : PFQueryTableViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tableSource;
}

//- (void)loadTable;

@property (nonatomic, strong) UITableView *tableSource;
@property(nonatomic,retain) MasterViewController *parent;

@property int currentRowsToDisplay;

@end

#define huddleCellHeight 88.0f
#define studentCellHeight 88.0f
#define classCellHeight 44.0f
#define requestsCellHeight 44.0f
