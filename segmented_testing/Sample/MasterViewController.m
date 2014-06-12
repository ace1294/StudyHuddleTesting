//
//  MasterViewController.m
//  Sample
//
//  Created by Jose Rafael Leon Bigio Anton on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "MasterViewController.h"
#import "DZNSegmentedControl.h"
#import "SegmentViewController.h"
#import <Parse/Parse.h>

#define _allowAppearance    YES
#define _bakgroundColor     [UIColor colorWithRed:0/255.0 green:87/255.0 blue:173/255.0 alpha:1.0]
#define _tintColor          [UIColor colorWithRed:20/255.0 green:200/255.0 blue:255/255.0 alpha:1.0]
#define _hairlineColor      [UIColor colorWithRed:0/255.0 green:36/255.0 blue:100/255.0 alpha:1.0]

#define _huddleOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:1.0f]
#define _huddleCharcoal     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]
#define _huddleMidnightBlue     [UIColor colorWithRed:45.0f/255.0f green:62.0f/255.0f blue:79.0f/255.0f alpha:1.0f]
#define _huddleSilver     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]

@interface MasterViewController ()

@property SegmentViewController *segmentController;

@end


@implementation MasterViewController


- (id)init
{
    self = [super init];
    if(self)
    {
        _segmentController = [[SegmentViewController alloc]init];
        _segmentController.parent = self;
    }
    
    return self;
}

+ (void)load
{
    if (!_allowAppearance) {
        return;
    }
    
    [[DZNSegmentedControl appearance] setBackgroundColor:[UIColor whiteColor]];
    [[DZNSegmentedControl appearance] setTintColor:_huddleOrange];
    [[DZNSegmentedControl appearance] setHairlineColor:[UIColor purpleColor]];
    
    [[DZNSegmentedControl appearance] setFont:Arial];
    [[DZNSegmentedControl appearance] setSelectionIndicatorHeight:2.5];
    [[DZNSegmentedControl appearance] setAnimationDuration:0.125];
    
}

- (void)loadView
{
    [super loadView];
    
    self.tableView.dataSource = _segmentController;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menuItems = @[[@"Studying" uppercaseString], [@"Classes" uppercaseString], [@"Huddles" uppercaseString], [@"Requests" uppercaseString]];
    CGRect myFrame = CGRectMake(0.0f, 220.0f, 320.0f, 30.0f);
    CGRect mySecondFrame = CGRectMake(0.0f, 255.0f, 320.0f, 313.0f);
    
    self.tableView.tableHeaderView = self.control;
    self.tableView.tableFooterView = [UIView new];
    self.control.frame = myFrame;
    
    //self.tableView.frame = mySecondFrame;
    
    [self.view addSubview:self.control];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:mySecondFrame style:UITableViewStylePlain];
    self.tableView.dataSource = _segmentController;
    self.tableView.delegate = _segmentController;
    [self.view addSubview:self.tableView];
    
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (DZNSegmentedControl *)control
{
    if (!_control)
    {
        _control = [[DZNSegmentedControl alloc] initWithItems:self.menuItems];
        _control.delegate = self;
        _control.selectedSegmentIndex = 1;
        _control.inverseTitles = YES;
        
        //        _control.backgroundColor = [UIColor lightGrayColor];
        //        _control.tintColor = [UIColor purpleColor];
        //        _control.hairlineColor = [UIColor purpleColor];
        //        _control.hairlineColor = self.view.tintColor;
                _control.showsCount = NO;
               _control.autoAdjustSelectionIndicatorWidth = YES;
        
        [_control addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _control;
}


#pragma mark - UITableViewDataSource Methods


//-(void)reloadTableView
//{
//    [self.tableView reloadData];
//}

#pragma mark - UITableViewDelegate Methods

#pragma mark - ViewController Methods




- (void)selectedSegment:(DZNSegmentedControl *)control
{
    [self.tableView reloadData];
}


#pragma mark - UIBarPositioningDelegate Methods

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionBottom;
}

@end
