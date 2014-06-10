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

@end

/*! Layout constants */

#define cellWidth 320.0f
#define cellHeight 88.0f

#define vertBorderSpacing 8.0f
#define vertElemSpacing 0.0f

//#define horiBorderSpacing 8.0f
#define horiBorderSpacingBottom 9.0f
#define horiElemSpacing 5.0f

#define vertTextBorderSpacing 10.0f

#define nameX avatarX+avatarDim+horiElemSpacing
#define nameY vertTextBorderSpacing
#define nameMaxWidth 200.0f

#define timeX avatarX+avatarDim+horiElemSpacing

#define requestStudyX 260.0
#define requestStudyY 38.0
#define requestStudyDimX 40.0
#define requestStudyDimY 20.0

/*!
 The protocol defines methods a delegate of a PAPBaseTextCell should implement.
 */
@protocol SHHuddleCellDelegate <SHBaseTableViewCellDelegate>
@optional

/*!
 Sent to the delegate when the activity button is tapped
 @param activity the PFObject of the activity that was tapped
 */
- (void)cell:(SHHuddleCell *)cellView didTapActivityButton:(PFObject *)requestStudy;

@end
