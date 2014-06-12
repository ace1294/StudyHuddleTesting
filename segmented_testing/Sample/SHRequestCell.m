//
//  SHRequestCell.m
//  Sample
//
//  Created by Jason Dimitriou on 6/10/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHRequestCell.h"
#import "SHPageImageView.h"

@interface SHRequestCell ()


@property (nonatomic, strong) UIButton *acceptButton;
@property (nonatomic, strong) UIButton *denyButton;
//@property (nonatomic, strong) SHPageImageView *huddleImageView;

@end

@implementation SHRequestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.acceptButton = [[UIButton alloc]init];
        [self.acceptButton setBackgroundColor:[UIColor greenColor]];
        self.acceptButton.layer.cornerRadius = 3;
        [self.acceptButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.acceptButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self.acceptButton.titleLabel setFont: Arial_Black];
        [self.acceptButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail]; //?????????????????
        //self.acceptButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //[self.acceptButton.titleLabel setShadowOffset:CGSizeMake( 0.0f, 1.0f)];
        [self.acceptButton addTarget:self action:@selector(didAcceptRequestTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.acceptButton];
        
        self.denyButton = [[UIButton alloc]init];
        [self.denyButton setBackgroundColor:[UIColor redColor]];
        self.denyButton.layer.cornerRadius = 3;
        [self.denyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.denyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self.denyButton.titleLabel setFont: Arial_Black];
        [self.denyButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail]; //?????????????????
        //self.denyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //[self.acceptButton.titleLabel setShadowOffset:CGSizeMake( 0.0f, 1.0f)];
        [self.denyButton addTarget:self action:@selector(didDenyRequestTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.denyButton];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.avatarImageView setHidden:YES];
    [self.acceptButton setFrame:CGRectMake(acceptX, acceptY, acceptDimX, acceptDimY)];
    [self.acceptButton setTitle:@"A" forState:UIControlStateNormal];
    [self.acceptButton setTitle:@"A" forState:UIControlStateHighlighted];

    [self.denyButton setFrame:CGRectMake(denyX, denyY, denyDimX, denyDimY)];
    [self.denyButton setTitle:@"D" forState:UIControlStateNormal];
    [self.denyButton setTitle:@"D" forState:UIControlStateHighlighted];
    
    
}

#pragma mark - Delegate methods

/* Inform delegate that a user image or name was tapped */
- (void)didAcceptRequestTapped:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didAcceptRequestTapped:)]) {
        [self.delegate cell:self didAcceptRequestTapped:self.user];
    }
}

/* Inform delegate that a user image or name was tapped */
- (void)didDenyRequestTapped:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didDenyRequestTapped:)]) {
        [self.delegate cell:self didDenyRequestTapped:self.user];
    }
}

@end
