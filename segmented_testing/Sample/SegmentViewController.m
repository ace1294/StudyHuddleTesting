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
#import "SHAddCell.h"
#import "SHClass.h"
#import "SHHuddle.h"
#import "SHStudent.h"

@interface SegmentViewController () <SHAddCellDelegate>

@property (strong, nonatomic) NSString *CellIdentifier;

@end

@implementation SegmentViewController

@synthesize tableSource;
@synthesize CellIdentifier;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.CellIdentifier = [[NSString alloc] init];
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
    return self.currentRowsToDisplay;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"HUDDLES"]){
        //NSLog(@"Huddles height");
        return huddleCellHeight;
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"CLASSES"]){
        //NSLog(@"Classes height");
        return classCellHeight;
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"REQUESTS"]){
        //NSLog(@"Classes height");
        return requestsCellHeight;
    }
    else{
        //NSLog(@"Student height");
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

    
    if (indexPath.row == self.currentRowsToDisplay-1){
        CellIdentifier = @"AddCell";
    }
    else if([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"HUDDLES"]){
        CellIdentifier = @"HuddleCell";
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"CLASSES"]){
        CellIdentifier = @"ClassCell";
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"REQUESTS"]){
        CellIdentifier = @"RequestCell";
    }
    

    SHBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    
    
    
        if([CellIdentifier isEqual:@"HuddleCell"])
        {
            NSLog(@"huddles was selected");
            PFObject* huddleObject = [self.parent.huddlesDataArray objectAtIndex:(int)indexPath.row];
            NSString* huddleName = huddleObject[@"huddleName"];
            [cell.titleButton setTitle:huddleName forState:UIControlStateNormal];
        }
        else if([CellIdentifier isEqual:@"ClassCell"])
        {
            
        }
        else if([CellIdentifier isEqual:@"RequestCell"])
        {

        }
        else if([CellIdentifier isEqual:@"AddCell"])
        {
            cell.delegate = self;
        }

    
    



    
    [cell layoutIfNeeded];
    
    return cell;
}


-(void)cell:(SHAddCell *)cellView didTapAddButton:(PFUser *)aUser
{
    if([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"HUDDLES"]){
       // SHHuddle *newHuddle = [[SHHuddle alloc] init];
        NSLog(@"New Huddle");
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"CLASSES"]){
       // SHClass *newClass = [[SHClass alloc] init];
        NSLog(@"New Class");
    }
    else if ([[self.parent.control titleForSegmentAtIndex:self.parent.control.selectedSegmentIndex]  isEqual: @"REQUESTS"]){
        NSLog(@"New Student");
    }
    else{
        NSLog(@"NBlack People");
    }
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
