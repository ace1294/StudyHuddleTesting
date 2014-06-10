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
@property (nonatomic, strong) UILabel *descriptionLabel;
//@property (nonatomic, strong) UIButton *leftButton;
//@property (nonatomic, strong) UIButton *rightButton;

//@property (nonatomic, strong) UILabel *timeLabel;
//@property (nonatomic, strong) UIImageView *separatorImage;

/*! The horizontal inset of the cell */
@property (nonatomic) CGFloat cellInsetWidth;

/*! Setters for the cell's content */
- (void)setContentText:(NSString *)contentString;
//- (void)setDate:(NSDate *)date;

- (void)setCellInsetWidth:(CGFloat)insetWidth;
//- (void)hideSeparator:(BOOL)hide;

/*! Static Helper methods */
+ (CGFloat)heightForCellWithName:(NSString *)name contentString:(NSString *)content;
+ (CGFloat)heightForCellWithName:(NSString *)name contentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset;
+ (NSString *)padString:(NSString *)string withFont:(UIFont *)font toWidth:(CGFloat)width;


@end

/*! Layout constants */
#define vertBorderSpacing 8.0f
#define vertElemSpacing 0.0f

#define horiBorderSpacing 5.0f
#define horiBorderSpacingBottom 9.0f
#define horiElemSpacing 5.0f

#define vertTextBorderSpacing 10.0f

#define avatarX 30.0f
#define avatarY 10.0f
#define avatarDim 68.0f

#define titleX avatarX+avatarDim+horiElemSpacing
#define titleY vertTextBorderSpacing
#define nameMaxWidth 200.0f

#define descriptionX avatarX+avatarDim+horiElemSpacing
#define descriptionY 40.0f

#define timeX avatarX+avatarDim+horiElemSpacing

#define Arial [UIFont fontWithName:@"Arial" size:12]
#define Arial_Black [UIFont fontWithName:@"Arial Black" size:15]


/*!
 The protocol defines methods a delegate of a PAPBaseTextCell should implement.
 */
@protocol SHBaseTableViewCellDelegate <NSObject>
@optional

/*!
 Sent to the delegate when a user button is tapped
 @param aUser the PFUser of the user that was tapped
 */
- (void)cell:(SHBaseTableViewCell *)cellView didTapTitleButton:(PFUser *)aUser;

@end
