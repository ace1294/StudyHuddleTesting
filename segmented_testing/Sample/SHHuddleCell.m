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
#define _huddleCharcoal     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]
#define _huddleMidnightBlue     [UIColor colorWithRed:45.0f/255.0f green:62.0f/255.0f blue:79.0f/255.0f alpha:1.0f]
#define _huddleSilver     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]


@interface SHHuddleCell ()


@property (nonatomic, strong) UIButton *requestStudyButton;
//@property (nonatomic, strong) SHPageImageView *huddleImageView;

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
        [self.requestStudyButton setTitleColor:_huddleMidnightBlue forState:UIControlStateNormal];
        [self.requestStudyButton setTitleColor:_huddleMidnightBlue forState:UIControlStateHighlighted];
        [self.requestStudyButton.titleLabel setFont: Arial];
        [self.requestStudyButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail]; //?????????????????
        self.requestStudyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //[self.titleButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[self.titleButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self.requestStudyButton.titleLabel setShadowOffset:CGSizeMake( 0.0f, 1.0f)];
        [self.requestStudyButton addTarget:self action:@selector(requestStudyTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.requestStudyButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.requestStudyButton setFrame:CGRectMake(requestStudyX, requestStudyY, requestStudyDimX, requestStudyDimY)];
    [self.requestStudyButton setTitle:@"Ask To Study" forState:UIControlStateNormal];
    [self.requestStudyButton setTitle:@"Ask To Study" forState:UIControlStateHighlighted];
    
    // Layout the activity image and show it if it is not nil (no image for the follow activity).
    // Note that the image view is still allocated and ready to be dispalyed since these cells
    // will be reused for all types of activity.
//    [self.avatarImageView setFrame:CGRectMake( avatarX, avatarY, 33.0f, 33.0f)];
//    [self.avatarImageButton setFrame:CGRectMake( [UIScreen mainScreen].bounds.size.width - 46.0f, 8.0f, 33.0f, 33.0f)];
    
    
//    [self.titleButton setTitleColor:_huddleOrange forState:UIControlStateNormal];
//    [self.titleButton setTitleColor:_huddleOrange forState:UIControlStateHighlighted];
    
//    // Add activity image if one was set
//    if (self.hasActivityImage) {
//        [self.activityImageView setHidden:NO];
//        [self.activityImageButton setHidden:NO];
//    } else {
//        [self.activityImageView setHidden:YES];
//        [self.activityImageButton setHidden:YES];
//    }
    
    // Change frame of the content text so it doesn't go through the right-hand side picture
//    CGSize descriptionSize = [self.descriptionLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 72.0f - 46.0f, CGFLOAT_MAX)
//                                                              options:NSStringDrawingUsesLineFragmentOrigin // wordwrap?
//                                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}
//                                                              context:nil].size;
//    [self.descriptionLabel setFrame:CGRectMake( descriptionX, descriptionY, descriptionSize.width, descriptionSize.height)];
    

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

- (void)requestStudyTapped:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapTitleButton:)]) {
        [self.delegate cell:self didTapTitleButton:self.user];
    }
}

@end
