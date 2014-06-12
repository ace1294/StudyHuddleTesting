//
//  SHBaseTableViewCell.h
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@class SHPageImageView;
@protocol SHBaseTableViewCellDelegate;

@interface SHBaseTableViewCell : UITableViewCell {
    NSUInteger horizontalTextSpace;
    id _delegate;
}

/*!
 Unfortunately, objective-c does not allow you to redefine the type of a property,
 so we cannot set the type of the delegate here. Doing so would mean that the subclass
 of would not be able to define new delegate methods (which we do in PAPActivityCell).
 */
@property (nonatomic, strong) id delegate;

/*! The user represented in the cell */
@property (nonatomic, strong) PFUser *user;

/*! The cell's views. These shouldn't be modified but need to be exposed for the subclass */
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, strong) UIButton *avatarImageButton;
@property (nonatomic, strong) SHPageImageView *avatarImageView;

/*! The horizontal inset of the cell */
@property (nonatomic) CGFloat cellInsetWidth;

/*! Setters for the cell's content */
- (void)setContentText:(NSString *)contentString;
//- (void)setDate:(NSDate *)date;

- (void)setCellInsetWidth:(CGFloat)insetWidth;

/*! Static Helper methods */
+ (CGFloat)heightForCellWithName:(NSString *)name contentString:(NSString *)content;
+ (CGFloat)heightForCellWithName:(NSString *)name contentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset;
+ (NSString *)padString:(NSString *)string withFont:(UIFont *)font toWidth:(CGFloat)width;


@end

/*! Layout constants */
//Huddle and Student cell is 88.0f height
//Class cell is 44.0f height
#define vertBorderSpacing 8.0f
#define vertElemSpacing 5.0f

#define horiBorderSpacing 5.0f
#define horiBorderSpacingBottom 9.0f
#define horiElemSpacing 5.0f

//Avatar
#define avatarX 15.0f
#define avatarY 10.0f
#define avatarDim 68.0f

//Title
#define titleX avatarX+avatarDim+horiElemSpacing
#define titleY vertBorderSpacing
#define nameMaxWidth 320.f-titleX-40.0f

//Description
#define descriptionX titleX
#define descriptionY titleY+vertElemSpacing
#define descriptionDimX 130.0f
#define descriptionDimY 45.0



#define Arial [UIFont fontWithName:@"Arial" size:12]
#define Arial_8 [UIFont fontWithName:@"Arial" size:8]
#define Arial_Black [UIFont fontWithName:@"Arial Black" size:15]

#define _huddleOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:1.0f]
#define _huddleAlphaOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:.2f]
#define _huddleCharcoal     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]
#define _huddleMidnightBlue     [UIColor colorWithRed:45.0f/255.0f green:62.0f/255.0f blue:79.0f/255.0f alpha:1.0f]
#define _huddleSilver     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]


/*!
 The protocol defines methods a delegate of a PAPBaseTextCell should implement.
 */
@protocol SHBaseTableViewCellDelegate <NSObject>
@optional

/*!
 Sent to the delegate when a user button is tapped
 @param aUser the PFUser of the user that was tapped
 */
- (void)cell:(SHBaseTableViewCell *)cellView didTapTitleButtonAction:(PFUser *)aUser;

@end
