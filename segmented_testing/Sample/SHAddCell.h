//
//  SHAddCell.h
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBaseTableViewCell.h"
#import <Parse/Parse.h>
@class SHPageImageView;

@interface SHAddCell : SHBaseTableViewCell

@property (nonatomic, strong) id delegate;

/*! The user represented in the cell */
@property (nonatomic, strong) PFUser *user;

- (void)didTapAddButtonAction:(id)sender;

@end

#define _huddleOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:1.0f]
#define _huddleAlphaOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:.2f]
#define _huddleCharcoal     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]
#define _huddleMidnightBlue     [UIColor colorWithRed:45.0f/255.0f green:62.0f/255.0f blue:79.0f/255.0f alpha:1.0f]
#define _huddleSilver     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]

#define Arial [UIFont fontWithName:@"Arial" size:12]
#define Arial_8 [UIFont fontWithName:@"Arial" size:8]
#define Arial_Black [UIFont fontWithName:@"Arial Black" size:15]

/*!
 The protocol defines methods a delegate of a PAPBaseTextCell should implement.
 */
@protocol SHAddCellDelegate <NSObject>
@optional

/*!
 Sent to the delegate when a user button is tapped
 @param aUser the PFUser of the user that was tapped
 */
- (void)cell:(SHAddCell *)cellView didTapAddButton:(PFUser *)aUser;

@end
