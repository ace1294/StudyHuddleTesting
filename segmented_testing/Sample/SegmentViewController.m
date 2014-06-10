//
//  SegmentViewController.m
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SegmentViewController.h"
#import "MasterViewController.h"
#import "SHHuddleCell.h"

@interface SegmentViewController ()

@end

@implementation SegmentViewController

@synthesize tableSource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)loadTable
//{
//    
//    [self.parent reloadTableView];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"Huddles"]){
        NSLog(@"Huddles height");
        return huddleCellHeight;
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"Classes"]){
        NSLog(@"Classes height");
        return classCellHeight;
    }
    else{
        NSLog(@"Student height");
        return studentCellHeight;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return .5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
 
    if (section == 0) {
        [headerView setBackgroundColor:[UIColor blackColor]];
    }
    return headerView;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SHHuddleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[SHHuddleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    
    NSString *temp = [NSString stringWithFormat:@"%@ #%d", [[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];
    [cell.titleButton setTitle:temp forState:UIControlStateNormal];
    //[NSString stringWithFormat:@"%@ #%d", [[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];
    cell.descriptionLabel.text = [NSString stringWithFormat:@"%@ %@ #%d", @"Description about this", [[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];

    
    return cell;
}



#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
