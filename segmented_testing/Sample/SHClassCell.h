//
//  SHClassCell.h
//  Sample
//
//  Created by Jason Dimitriou on 6/10/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHBaseTableViewCell.h"

@interface SHClassCell : SHBaseTableViewCell

@end


@protocol SHClassCellDelegate <SHBaseTableViewCellDelegate>
@optional

/*!
 Sent to the delegate when the activity button is tapped
 @param activity the PFObject of the activity that was tapped
 */
- (void)cell:(SHClassCell *)cellView didTapArrowButtonAction:(PFObject *)requestStudy;

@end