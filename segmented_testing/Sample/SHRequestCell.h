//
//  SHRequestCell.h
//  Sample
//
//  Created by Jason Dimitriou on 6/10/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHBaseTableViewCell.h"

@interface SHRequestCell : SHBaseTableViewCell

@end

#define acceptX 260.0
#define acceptY 16.0
#define acceptDimX 20.0
#define acceptDimY 20.0

#define denyX acceptX+acceptDimY
#define denyY 16.0
#define denyDimX acceptDimX
#define denyDimY acceptDimY

@protocol SHRequestCellDelegate <SHBaseTableViewCellDelegate>
@optional

/*!
 Sent to the delegate when the activity button is tapped
 @param activity the PFObject of the activity that was tapped
 */
- (void)cell:(SHRequestCell *)cellView didAcceptRequestTapped:(PFObject *)requestStudy;
- (void)cell:(SHRequestCell *)cellView didDenyRequestTapped:(PFObject *)requestStudy;

@end

