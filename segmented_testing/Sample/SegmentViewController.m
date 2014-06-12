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
#import "SHClassCell.h"
#import "SHRequestCell.h"

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
    
    if([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"HUDDLES"]){
        NSLog(@"Huddles height");
        return huddleCellHeight;
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"CLASSES"]){
        NSLog(@"Classes height");
        return classCellHeight;
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"REQUESTS"]){
        NSLog(@"Classes height");
        return requestsCellHeight;
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
    
    if([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"HUDDLES"]){
        CellIdentifier = @"HuddlesCell";
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"CLASSES"]){
        CellIdentifier = @"ClassesCell";
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"REQUESTS"]){
        CellIdentifier = @"RequestsCell";
    }
//    else{
//        CellIdentifier
//    }
//    
    

    SHBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        if([CellIdentifier isEqual:@"HuddlesCell"])
        {
            cell = [[SHHuddleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.textLabel.textColor = [UIColor darkGrayColor];
        }
        else if([CellIdentifier isEqual:@"ClassesCell"])
        {
            cell = [[SHClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.textLabel.textColor = [UIColor darkGrayColor];
        }
        else if([CellIdentifier isEqual:@"RequestsCell"])
        {
            cell = [[SHRequestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.textLabel.textColor = [UIColor darkGrayColor];
        }
        else
        return nil;
     
    }
    
    NSString *temp = [NSString stringWithFormat:@"%@ #%d", [[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];
    [cell.titleButton setTitle:temp forState:UIControlStateNormal];
    //[NSString stringWithFormat:@"%@ #%d", [[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex] capitalizedString], (int)indexPath.row+1];
    
    [cell layoutIfNeeded];
    
    return cell;
}



#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
