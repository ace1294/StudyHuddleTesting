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
@property (nonatomic, strong) UILabel *descriptionLabel;
//@property (nonatomic, strong) SHPageImageView *huddleImageView;

@end

@implementation SHRequestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.acceptButton = [[UIButton alloc]init];
        [self.acceptButton setImage:[UIImage imageNamed:@"Accept@2x.png"] forState:UIControlStateNormal];
        [self.acceptButton addTarget:self action:@selector(didTapAcceptButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.acceptButton];
        
        self.denyButton = [[UIButton alloc]init];
        [self.denyButton setImage:[UIImage imageNamed:@"Deny@2x.png"] forState:UIControlStateNormal];
        [self.denyButton addTarget:self action:@selector(didTapDenyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.denyButton];
        
        self.descriptionLabel = [[UILabel alloc]init];
        [self.descriptionLabel setFont:Arial_8];
        [self.descriptionLabel setTextColor:_huddleSilver];
        [self.descriptionLabel setNumberOfLines:0];
        [self.descriptionLabel sizeToFit];
        [self.descriptionLabel setBackgroundColor:[UIColor clearColor]];
        [self.mainView addSubview:self.descriptionLabel];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.avatarImageView setHidden:YES];
    [self.acceptButton setFrame:CGRectMake(acceptX, acceptY, acceptDimX, acceptDimY)];

    [self.denyButton setFrame:CGRectMake(denyX, denyY, denyDimX, denyDimY)];
    
    [self.descriptionLabel setFrame:CGRectMake(20.0, 20.0, 100.0, 20.0)];
    self.descriptionLabel.text = @"Jason wants to study with you";
    
}

#pragma mark - Delegate methods

/* Inform delegate that a user image or name was tapped */
- (void)didTapAcceptButtonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapAcceptButton:)]) {
        [self.delegate cell:self didTapAcceptButton:self.user];
    }
}

/* Inform delegate that a user image or name was tapped */
- (void)didTapDenyButtonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapDenyButton:)]) {
        [self.delegate cell:self didTapDenyButton:self.user];
    }
}

@end
