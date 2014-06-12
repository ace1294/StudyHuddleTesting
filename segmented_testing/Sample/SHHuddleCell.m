//
//  SHHuddleCell.m
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHHuddleCell.h"
#import "SHPageImageView.h"

#define _huddleOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:1.0f]
#define _huddleAlphaOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:.2f]
#define _huddleCharcoal     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]
#define _huddleMidnightBlue     [UIColor colorWithRed:45.0f/255.0f green:62.0f/255.0f blue:79.0f/255.0f alpha:1.0f]
#define _huddleSilver     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]


@interface SHHuddleCell ()

@property (nonatomic, strong) UIButton *requestStudyButton;
@property (nonatomic, strong) UILabel *membersLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UILabel *classLabel;

@end

@implementation SHHuddleCell

@synthesize requestStudyButton;

#pragma mark - NSObject

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.requestStudyButton = [[UIButton alloc] init];
        [self.requestStudyButton setBackgroundColor:_huddleOrange];
        self.requestStudyButton.layer.cornerRadius = 3;
        [self.requestStudyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.requestStudyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self.requestStudyButton.titleLabel setFont: Arial_Black];
        [self.requestStudyButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail]; //?????????????????
        self.requestStudyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.requestStudyButton addTarget:self action:@selector(didTapStudyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.requestStudyButton];
        
        self.membersLabel = [[UILabel alloc] init];
        [self.membersLabel setFont:Arial];
        [self.membersLabel setTextColor:_huddleSilver];
        [self.membersLabel setNumberOfLines:0];
        [self.membersLabel sizeToFit];
        [self.membersLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.membersLabel setBackgroundColor:[UIColor clearColor]];
        [self.mainView addSubview:self.membersLabel];
    
        self.statusLabel = [[UILabel alloc] init];
        [self.statusLabel setFont:Arial];
        [self.statusLabel setTextColor:_huddleSilver];
        [self.statusLabel setNumberOfLines:0];
        [self.statusLabel sizeToFit];
        [self.statusLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.statusLabel setBackgroundColor:[UIColor clearColor]];
        [self.mainView addSubview:self.statusLabel];
        
        self.classLabel = [[UILabel alloc] init];
        [self.classLabel setFont:Arial];
        [self.classLabel setTextColor:_huddleSilver];
        [self.classLabel setNumberOfLines:0];
        [self.classLabel sizeToFit];
        [self.classLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.classLabel setBackgroundColor:[UIColor clearColor]];
        [self.mainView addSubview:self.classLabel];
        
        [self.contentView addSubview:self.mainView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    

    
//    // Add activity image if one was set
//    if (self.hasActivityImage) {
//        [self.activityImageView setHidden:NO];
//        [self.activityImageButton setHidden:NO];
//    } else {
//        [self.activityImageView setHidden:YES];
//        [self.activityImageButton setHidden:YES];
//    }
    
    //Title button
    CGSize titleSize = [self.titleButton.titleLabel.text boundingRectWithSize:CGSizeMake(nameMaxWidth, CGFLOAT_MAX)
                                                                      options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin // word wrap?
                                                                   attributes:@{NSFontAttributeName:Arial_Black}
                                                                      context:nil].size;
    
    // Change frame of the content text so it doesn't go through the right-hand side picture
    
    [self.requestStudyButton setFrame:CGRectMake(requestStudyX + descriptionDimX, requestStudyY, requestStudyDimX, requestStudyDimY)];
    [self.requestStudyButton setTitle:@"Ask To Study" forState:UIControlStateNormal];
    [self.requestStudyButton setTitle:@"Ask To Study" forState:UIControlStateHighlighted];
    
    [self.membersLabel setFrame:CGRectMake(descriptionX, descriptionY+titleSize.height, descriptionDimX, 10.0)];
    self.membersLabel.text = @"10 Members";
    
    [self.statusLabel setFrame:CGRectMake(descriptionX, self.membersLabel.frame.origin.y+titleSize.height, descriptionDimX, 10.0)];
    self.statusLabel.text = @"Open";
    
    [self.classLabel setFrame:CGRectMake(descriptionX, self.statusLabel.frame.origin.y+titleSize.height, descriptionDimX, 10.0)];
    self.classLabel.text = @"GOV 310";

    

}

//- (void)setActivity:(PFObject *)activity {
//    // Set the activity property
//    _activity = activity;
//    if ([[activity objectForKey:kPAPActivityTypeKey] isEqualToString:kPAPActivityTypeFollow] || [[activity objectForKey:kPAPActivityTypeKey] isEqualToString:kPAPActivityTypeJoined]) {
//        [self setActivityImageFile:nil];
//    } else {
//        [self setActivityImageFile:(PFFile*)[[activity objectForKey:kPAPActivityPhotoKey] objectForKey:kPAPPhotoThumbnailKey]];
//    }
//    
//    NSString *activityString = [PAPActivityFeedViewController stringForActivityType:(NSString*)[activity objectForKey:kPAPActivityTypeKey]];
//    self.user = [activity objectForKey:kPAPActivityFromUserKey];
//    
//    // Set name button properties and avatar image
//    [self.avatarImageView setFile:[self.user objectForKey:kPAPUserProfilePicSmallKey]];
//    
//    NSString *nameString = NSLocalizedString(@"Someone", @"Text when the user's name is unknown");
//    if (self.user && [self.user objectForKey:kPAPUserDisplayNameKey] && [[self.user objectForKey:kPAPUserDisplayNameKey] length] > 0) {
//        nameString = [self.user objectForKey:kPAPUserDisplayNameKey];
//    }
//    
//    [self.nameButton setTitle:nameString forState:UIControlStateNormal];
//    [self.nameButton setTitle:nameString forState:UIControlStateHighlighted];
//    
//    // If user is set after the contentText, we reset the content to include padding
//    if (self.contentLabel.text) {
//        [self setContentText:self.contentLabel.text];
//    }
//    
//    if (self.user) {
//        CGSize nameSize = [self.nameButton.titleLabel.text boundingRectWithSize:CGSizeMake(nameMaxWidth, CGFLOAT_MAX)
//                                                                        options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
//                                                                     attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f]}
//                                                                        context:nil].size;
//        NSString *paddedString = [PAPBaseTextCell padString:activityString withFont:[UIFont systemFontOfSize:13.0f] toWidth:nameSize.width];
//        [self.contentLabel setText:paddedString];
//    } else { // Otherwise we ignore the padding and we'll add it after we set the user
//        [self.contentLabel setText:activityString];
//    }
//    
//    [self.timeLabel setText:[timeFormatter stringForTimeIntervalFromDate:[NSDate date] toDate:[activity createdAt]]];
//    
//    [self setNeedsDisplay];
//}

//- (void)didTapActivityButton:(id)sender {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapActivityButton:)]) {
//        [self.delegate cell:self didTapActivityButton:self.activity];
//    }
//}

- (void)didTapStudyButtonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapStudyButton:)]) {
        [self.delegate cell:self didTapStudyButton:self.user];
    }
}

@end
