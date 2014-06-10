//
//  SHBaseTableViewCell.m
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHBaseTableViewCell.h"
#import "SHPageImageView.h"

#define _huddleOrange     [UIColor colorWithRed:255.0f/255.0f green:183.0f/255.0f blue:24.0f/255.0f alpha:1.0f]
#define _huddleCharcoal     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]
#define _huddleMidnightBlue     [UIColor colorWithRed:45.0f/255.0f green:62.0f/255.0f blue:79.0f/255.0f alpha:1.0f]
#define _huddleSilver     [UIColor colorWithRed:128.0f/255.0f green:130.0f/255.0f blue:133.0f/255.0f alpha:1.0f]

@interface SHBaseTableViewCell () {
    BOOL hideSeparator; // True if the separator shouldn't be shown
}

/* Private static helper to obtain the horizontal space left for name and content after taking the inset and image in consideration */
+ (CGFloat)horizontalTextSpaceForInsetWidth:(CGFloat)insetWidth;
@end

@implementation SHBaseTableViewCell

@synthesize mainView;
@synthesize cellInsetWidth;
@synthesize avatarImageView;
@synthesize avatarImageButton;
@synthesize titleButton;
@synthesize descriptionLabel;
//@synthesize leftButton;
//@synthesize rightButton;

//@synthesize timeLabel;
//@synthesize separatorImage;
//@synthesize delegate;
@synthesize user;


#pragma mark - NSObject
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        cellInsetWidth = 0.0f;
        hideSeparator = NO;
        self.clipsToBounds = YES;
        horizontalTextSpace =  [SHBaseTableViewCell horizontalTextSpaceForInsetWidth:cellInsetWidth];
        
        self.opaque = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;
        self.backgroundColor = [UIColor clearColor];
        
        mainView = [[UIView alloc] initWithFrame:self.contentView.frame];
        //[mainView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundComments.png"]]];
        
        //Avator Image on Left Side of Cell
        self.avatarImageView = [[SHPageImageView alloc] init];
        [self.avatarImageView setBackgroundColor:[UIColor clearColor]];
        [self.avatarImageView setOpaque:YES];
        [mainView addSubview:self.avatarImageView];
        
        //Title Button
        self.titleButton = [[UIButton alloc] init];
        [self.titleButton setBackgroundColor:[UIColor clearColor]];
        [self.titleButton setTitleColor:_huddleOrange forState:UIControlStateNormal];
        [self.titleButton setTitleColor:_huddleOrange forState:UIControlStateHighlighted];
        [self.titleButton.titleLabel setFont: Arial_Black];
        [self.titleButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail]; //?????????????????
        self.titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //[self.titleButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[self.titleButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self.titleButton.titleLabel setShadowOffset:CGSizeMake( 0.0f, 1.0f)];
        [self.titleButton addTarget:self action:@selector(didTapTitleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:self.titleButton];
        
        //Description Label
        self.descriptionLabel = [[UILabel alloc] init];
        [self.descriptionLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [self.descriptionLabel setTextColor:_huddleSilver];
        [self.descriptionLabel setNumberOfLines:0];
        [self.descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping]; //??????????????????????
        [self.descriptionLabel setBackgroundColor:[UIColor clearColor]];
        //[self.descriptionLabel setShadowColor:[UIColor colorWithWhite:1.0f alpha:0.70f]];
        //[self.descriptionLabel setShadowOffset:CGSizeMake( 0.0f, 1.0f)];
        [mainView addSubview:self.descriptionLabel];
        
//        self.timeLabel = [[UILabel alloc] init];
//        [self.timeLabel setFont:[UIFont systemFontOfSize:11]];
//        [self.timeLabel setTextColor:[UIColor grayColor]];
//        [self.timeLabel setBackgroundColor:[UIColor clearColor]];
//        [self.timeLabel setShadowColor:[UIColor colorWithWhite:1.0f alpha:0.70f]];
//        [self.timeLabel setShadowOffset:CGSizeMake(0, 1)];
//        [mainView addSubview:self.timeLabel];
        
        
        self.avatarImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.avatarImageButton setBackgroundColor:[UIColor clearColor]];
        [self.avatarImageButton addTarget:self action:@selector(didTapTitleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [mainView addSubview:self.avatarImageButton];
        
//        self.separatorImage = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"SeparatorComments.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 1)]];
//        [mainView addSubview:separatorImage];
        
        //Left Button
//        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.leftButton setBackgroundColor:[UIColor clearColor]];
//        [self.leftButton setTitleColor:_huddleOrange forState:UIControlStateNormal];
//        [self.leftButton setTitleColor:_huddleOrange forState:UIControlStateHighlighted];
//        [self.leftButton.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
//        [self.leftButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail]; //?????????????????
//        //[self.leftButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        //[self.leftButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateSelected];
//        [self.leftButton.titleLabel setShadowOffset:CGSizeMake( 0.0f, 1.0f)];
//        [self.leftButton addTarget:self action:@selector(didTapTitleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//        [mainView addSubview:self.leftButton];
//        
//        //Right Button
//        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.rightButton setBackgroundColor:[UIColor clearColor]];
//        [self.rightButton setTitleColor:_huddleOrange forState:UIControlStateNormal];
//        [self.rightButton setTitleColor:_huddleOrange forState:UIControlStateHighlighted];
//        [self.rightButton.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
//        [self.rightButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail]; //?????????????????
//        //[self.rightButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        //[self.rightButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateSelected];
//        [self.rightButton.titleLabel setShadowOffset:CGSizeMake( 0.0f, 1.0f)];
//        [self.rightButton addTarget:self action:@selector(didTapTitleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//        [mainView addSubview:self.rightButton];
        
        [self.contentView addSubview:mainView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [mainView setFrame:CGRectMake(cellInsetWidth, self.contentView.frame.origin.y, self.contentView.frame.size.width-2*cellInsetWidth, self.contentView.frame.size.height)];
    
    // Layout avatar image
    [self.avatarImageView setFrame:CGRectMake(avatarX, avatarY, avatarDim, avatarDim)];
    [self.avatarImageButton setFrame:CGRectMake(avatarX, avatarY, avatarDim, avatarDim)];
    
    // Layout the name button
    CGSize nameSize = [self.titleButton.titleLabel.text boundingRectWithSize:CGSizeMake(nameMaxWidth, CGFLOAT_MAX)
                                                                    options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin // word wrap?
                                                                 attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f]}
                                                                    context:nil].size;
    [self.titleButton setFrame:CGRectMake(titleX, titleY, nameSize.width * 2, nameSize.height)];
    
    // Layout the content
    CGSize descriptionSize = [self.descriptionLabel.text boundingRectWithSize:CGSizeMake(horizontalTextSpace, CGFLOAT_MAX)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}
                                                              context:nil].size;
    [self.descriptionLabel setFrame:CGRectMake(descriptionX, descriptionY, descriptionSize.width, descriptionSize.height)];
    
    // Layout the timestamp label
//    CGSize timeSize = [self.timeLabel.text boundingRectWithSize:CGSizeMake(horizontalTextSpace, CGFLOAT_MAX)
//                                                        options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
//                                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}
//                                                        context:nil].size;
//    [self.timeLabel setFrame:CGRectMake(timeX, contentLabel.frame.origin.y + contentLabel.frame.size.height + vertElemSpacing, timeSize.width, timeSize.height)];
    
    // Layour separator
//    [self.separatorImage setFrame:CGRectMake(0, self.frame.size.height-2, self.frame.size.width-cellInsetWidth*2, 2)];
//    [self.separatorImage setHidden:hideSeparator];
}

//- (void)drawRect:(CGRect)rect {
//    // Add a drop shadow in core graphics on the sides of the cell
//    [super drawRect:rect];
//    if (self.cellInsetWidth != 0) {
//        [PAPUtility drawSideDropShadowForRect:mainView.frame inContext:UIGraphicsGetCurrentContext()];
//    }
//}

#pragma mark - Delegate methods

/* Inform delegate that a user image or name was tapped */
- (void)didTapTitleButtonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapTitleButton:)]) {
        [self.delegate cell:self didTapTitleButton:self.user];
    }
}

#pragma mark - PAPBaseTextCell

/* Static helper to get the height for a cell if it had the given name and content */
+ (CGFloat)heightForCellWithName:(NSString *)name contentString:(NSString *)content {
    return [SHBaseTableViewCell heightForCellWithName:name contentString:content cellInsetWidth:0];
}

/* Static helper to get the height for a cell if it had the given name, content and horizontal inset */
+ (CGFloat)heightForCellWithName:(NSString *)name contentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset {
    CGSize nameSize = [name boundingRectWithSize:nameSize
                                         options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f]}
                                         context:nil].size;
    
    NSString *paddedString = [SHBaseTableViewCell padString:content withFont:[UIFont systemFontOfSize:13] toWidth:nameSize.width];
    CGFloat horizontalTextSpace = [SHBaseTableViewCell horizontalTextSpaceForInsetWidth:cellInset];
    
    CGSize contentSize = [paddedString boundingRectWithSize:CGSizeMake(horizontalTextSpace, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesLineFragmentOrigin // word wrap?
                                                 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}
                                                    context:nil].size;
    
    CGFloat singleLineHeight = [@"test" boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}
                                                     context:nil].size.height;
    
    // Calculate the added height necessary for multiline text. Ensure value is not below 0.
    CGFloat multilineHeightAddition = (contentSize.height - singleLineHeight) > 0 ? (contentSize.height - singleLineHeight) : 0;
    
    return horiBorderSpacing + avatarDim + horiBorderSpacingBottom + multilineHeightAddition;
}

/* Static helper to obtain the horizontal space left for name and content after taking the inset and image in consideration */
+ (CGFloat)horizontalTextSpaceForInsetWidth:(CGFloat)insetWidth {
    return (320-(insetWidth*2)) - (horiBorderSpacing+avatarDim+horiElemSpacing+horiBorderSpacing);
}

/* Static helper to pad a string with spaces to a given beginning offset */
+ (NSString *)padString:(NSString *)string withFont:(UIFont *)font toWidth:(CGFloat)width {
    // Find number of spaces to pad
    NSMutableString *paddedString = [[NSMutableString alloc] init];
    while (true) {
        [paddedString appendString:@" "];
        CGSize resultSize = [paddedString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                       options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:font}
                                                       context:nil].size;
        if (resultSize.width >= width) {
            break;
        }
    }
    
    // Add final spaces to be ready for first word
    [paddedString appendString:[NSString stringWithFormat:@" %@",string]];
    return paddedString;
}

//- (void)setUser:(PFUser *)aUser {
//    user = aUser;
//    
//    // Set name button properties and avatar image
//    [self.avatarImageView setFile:[self.user objectForKey:kPAPUserProfilePicSmallKey]];
//    [self.titleButton setTitle:[self.user objectForKey:kPAPUserDisplayNameKey] forState:UIControlStateNormal];
//    [self.titleButton setTitle:[self.user objectForKey:kPAPUserDisplayNameKey] forState:UIControlStateHighlighted];
//    
//    // If user is set after the contentText, we reset the content to include padding
//    if (self.descriptionLabel.text) {
//        [self setContentText:self.contentLabel.text];
//    }
//    [self setNeedsDisplay];
//}

- (void)setContentText:(NSString *)contentString {
    // If we have a user we pad the content with spaces to make room for the name
    if (self.user) {
        CGSize nameSize = [self.titleButton.titleLabel.text boundingRectWithSize:CGSizeMake(nameMaxWidth, CGFLOAT_MAX)
                                                                        options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                                                     attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f]}
                                                                        context:nil].size;
        NSString *paddedString = [SHBaseTableViewCell padString:contentString withFont:[UIFont systemFontOfSize:13] toWidth:nameSize.width];
        [self.descriptionLabel setText:paddedString];
    } else { // Otherwise we ignore the padding and we'll add it after we set the user
        [self.descriptionLabel setText:contentString];
    }
    [self setNeedsDisplay];
}

@end
