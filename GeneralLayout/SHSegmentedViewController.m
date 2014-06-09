//
//  SHSegmentedViewController.m
//  GeneralLayout
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 StudyHuddle. All rights reserved.
//

#import "SHSegmentedViewController.h"
#import "DZNSegmentedControl/DZNSegmentedControl.h"

#define _huddleOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:1.0f]
#define _huddleCharcoal     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]
#define _huddleMidnightBlue     [UIColor colorWithRed:45.0f/255.0f green:62.0f/255.0f blue:79.0f/255.0f alpha:1.0f]

@interface SHSegmentedViewController () <DZNSegmentedControlDelegate>

@property (nonatomic)  DZNSegmentedControl *control;
@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation SHSegmentedViewController

+ (void)load
{
//    if (!_allowAppearance) {
//        return;
//    }
    
    [[DZNSegmentedControl appearance] setBackgroundColor:_huddleOrange];
    [[DZNSegmentedControl appearance] setTintColor:_huddleMidnightBlue];
    [[DZNSegmentedControl appearance] setHairlineColor:[UIColor whiteColor]];
    
    [[DZNSegmentedControl appearance] setFont:[UIFont fontWithName:@"EuphemiaUCAS" size:15.0]];
    [[DZNSegmentedControl appearance] setSelectionIndicatorHeight:2.5];
    [[DZNSegmentedControl appearance] setAnimationDuration:0.125];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor], NSFontAttributeName: [UIFont systemFontOfSize:18.0]}];
}

- (void)loadView
{
    [super loadView];
    
    self.title = @"DZNSegmentedControl";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSegment:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshSegments:)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menuItems = @[[@"Tweets" uppercaseString], [@"Following" uppercaseString], [@"Followers" uppercaseString]];
    
    self.tableView.tableHeaderView = self.control;
    self.tableView.tableFooterView = [UIView new];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateControlCounts];
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
        //        _control.showsCount = NO;
        //        _control.autoAdjustSelectionIndicatorWidth = YES;
        
        [_control addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _control;
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ #%d", [[self.control titleForSegmentAtIndex:self.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - ViewController Methods

- (void)addSegment:(id)sender
{
    NSUInteger newSegment = self.control.numberOfSegments;
    
    [self.control setTitle:[@"Favorites" uppercaseString] forSegmentAtIndex:self.control.numberOfSegments];
    [self.control setCount:@((arc4random()%300)) forSegmentAtIndex:newSegment];
}

- (void)refreshSegments:(id)sender
{
    if (self.control.selectedSegmentIndex >= 0) {
        [self.control removeAllSegments];
    }
    else {
        [self.control setItems:self.menuItems];
        [self updateControlCounts];
    }
}

- (void)updateControlCounts
{
    [self.control setCount:@((arc4random()%300)) forSegmentAtIndex:0];
    [self.control setCount:@((arc4random()%300)) forSegmentAtIndex:1];
    [self.control setCount:@((arc4random()%300)) forSegmentAtIndex:2];
//    
//    if (_allowAppearance) {
//        [self.control setTitleColor:_hairlineColor forState:UIControlStateNormal];
//    }
}

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

