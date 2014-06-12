//
//  SHClassCell.m
//  Sample
//
//  Created by Jason Dimitriou on 6/10/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHClassCell.h"
#import "SHPageImageView.h"

@interface SHClassCell ()

@property (nonatomic, strong) UILabel *teacherNameLabel;
@property (nonatomic, strong) UILabel *teacherEmailLabel;
@property (nonatomic, strong) UILabel *teacherOfficeLabel;
@property (nonatomic, strong) UIButton *arrowButton;

@end

@implementation SHClassCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.teacherNameLabel = [[UILabel alloc] init];
        [self.teacherNameLabel setFont:Arial_8];
        [self.teacherNameLabel setTextColor:_huddleSilver];
        [self.teacherNameLabel setNumberOfLines:0];
        [self.teacherNameLabel sizeToFit];
        [self.teacherNameLabel setBackgroundColor:[UIColor clearColor]];
        [self.mainView addSubview:self.teacherNameLabel];
        
        self.teacherEmailLabel = [[UILabel alloc] init];
        [self.teacherEmailLabel setFont:Arial_8];
        [self.teacherEmailLabel setTextColor:_huddleSilver];
        [self.teacherEmailLabel setNumberOfLines:0];
        [self.teacherEmailLabel sizeToFit];
        [self.teacherEmailLabel setBackgroundColor:[UIColor clearColor]];
        [self.mainView addSubview:self.teacherEmailLabel];
        
        self.teacherOfficeLabel = [[UILabel alloc] init];
        [self.teacherOfficeLabel setFont:Arial_8];
        [self.teacherOfficeLabel setTextColor:_huddleSilver];
        [self.teacherOfficeLabel setNumberOfLines:0];
        [self.teacherOfficeLabel sizeToFit];
        [self.teacherOfficeLabel setBackgroundColor:[UIColor clearColor]];
        [self.mainView addSubview:self.teacherOfficeLabel];
        
        self.arrowButton = [[UIButton alloc]init];
        [self.arrowButton setImage:[UIImage imageNamed:@"Right_Pointing_Arrow@2x.png"] forState:UIControlStateNormal];
        [self.arrowButton setImage:[UIImage imageNamed:@"Right_Pointing_Arrow@2x.png"] forState:UIControlStateHighlighted];
        [self.arrowButton setBackgroundColor:[UIColor clearColor]];
        [self.arrowButton addTarget:self action:@selector(didTapArrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.arrowButton];
        
        [self.contentView addSubview:self.mainView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.avatarImageView setHidden:YES];
    [self.avatarImageButton setHidden:YES];
    
    CGSize titleSize = [self.titleButton.titleLabel.text boundingRectWithSize:CGSizeMake(nameMaxWidth, CGFLOAT_MAX)
                                                                      options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin // word wrap?
                                                                   attributes:@{NSFontAttributeName:Arial_Black}
                                                                      context:nil].size;
    [self.titleButton setFrame:CGRectMake(40.0, 5.0, titleSize.width * 2, titleSize.height)];

    
    [self.teacherNameLabel setFrame:CGRectMake(40.0, 20.0, 60.0, 20.0)];
    self.teacherNameLabel.text = @"Jan Rellermeyer";
    
    [self.teacherEmailLabel setFrame:CGRectMake(110.0, 20.0, 90.0, 20.0)];
    self.teacherEmailLabel.text = @"jrellerm@cs.utexas.edu";
    
    [self.teacherOfficeLabel setFrame:CGRectMake(210.0, 20.0, 60.0, 20.0)];
    self.teacherOfficeLabel.text = @"GDC 4.301";
    
    [self.arrowButton setFrame:CGRectMake(270.0, 7.0, 30.0, 30.0)];

    
    
    
}

#pragma mark - Delegate methods

/* Inform delegate that a user image or name was tapped */
- (void)didTapArrowButtonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapArrowButton:)]) {
        [self.delegate cell:self didTapArrowButton:self.user];
    }
}


@end
