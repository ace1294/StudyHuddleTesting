//
//  SHHuddleCell.h
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHBaseTableViewCell.h"

@protocol SHHuddleCellDelegate;

@interface SHHuddleCell : SHBaseTableViewCell

//@property (nonatomic, strong) PFObject *requestStudy;

- (void)didTapStudyButtonAction:(id)sender;

@end

/*! Layout constants */

#define cellWidth 320.0f
#define cellHeight 88.0f

#define vertBorderSpacing 8.0f

//#define horiBorderSpacing 8.0f
#define horiBorderSpacingBottom 9.0f
#define horiElemSpacing 5.0f

#define vertTextBorderSpacing 10.0f

#define timeX avatarX+avatarDim+horiElemSpacing

#define requestStudyX descriptionX+horiElemSpacing
#define requestStudyY 28.0
#define requestStudyDimX 80.0
#define requestStudyDimY 40.0

/*!
 The protocol defines methods a delegate of a PAPBaseTextCell should implement.
 */
@protocol SHHuddleCellDelegate <SHBaseTableViewCellDelegate>
@optional

/*!
 Sent to the delegate when the activity button is tapped
 @param activity the PFObject of the activity that was tapped
 */
- (void)cell:(SHHuddleCell *)cellView didTapStudyButton:(PFObject *)requestStudy;

@end
