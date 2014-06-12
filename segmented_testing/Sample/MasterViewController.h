//
//  MasterViewController.h
//  Sample
//
//  Created by Jose Rafael Leon Bigio Anton on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNSegmentedControl.h"


@interface MasterViewController : UIViewController <DZNSegmentedControlDelegate>

@property (nonatomic, strong) DZNSegmentedControl *control;
@property (nonatomic, retain)  UITableView *tableView;
@property (nonatomic, strong) NSArray *menuItems;

@property NSMutableArray *studyingDataArray;
@property NSMutableArray* classesDataArray;
@property NSMutableArray* huddlesDataArray;
@property NSMutableArray* requestsDataArray;

@property NSMutableArray* encapsulatingDataArray;

//- (void) reloadTableView;

@end

#define Arial [UIFont fontWithName:@"Arial" size:12]
#define Arial_Black [UIFont fontWithName:@"Arial Black" size:15]