//
//  SHAddCell.m
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHAddCell.h"

@interface SHAddCell ()

@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIImageView *addImageView;

@end

@implementation SHAddCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        //Title Button
        self.titleButton = [[UIButton alloc] init];
        [self.titleButton setBackgroundColor:[UIColor clearColor]];
        [self.titleButton setTitleColor:_huddleOrange forState:UIControlStateNormal];
        [self.titleButton setTitleColor:_huddleAlphaOrange forState:UIControlStateHighlighted];
        [self.titleButton.titleLabel setFont: Arial_Black];
        [self.titleButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        self.titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.titleButton addTarget:self action:@selector(didTapAddButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.titleButton];
        
        //Avator Image on Left Side of Cell
        self.addImageView = [[UIImageView alloc] init];
        [self.addImageView setBackgroundColor:[UIColor clearColor]];
        [self.addImageView setOpaque:YES];
        [self.addImageView setImage:[UIImage imageNamed:@"plusSign@2x.png"]];
        [self.mainView addSubview:self.addImageView];
        
        //Avatar Button
        self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addButton setBackgroundColor:[UIColor clearColor]];
        [self.addButton addTarget:self action:@selector(didTapAddButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.addButton];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    
    //Title button
    
    
    // Change frame of the content text so it doesn't go through the right-hand side picture
    
    [self.addButton setFrame:CGRectMake(200.0, 20.0, 40.0, 40.0)];
    [self.addImageView setFrame:CGRectMake(200.0, 20.0, 40.0, 40.0)];
    
    
    [self.titleButton setFrame:CGRectMake(60.0, 30.0, 200.0, 40.0)];
    [self.titleButton.titleLabel setText:@"Add Huddle"];
    
}


- (void)didTapAddButtonAction:(id)sender;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:didTapAddButton:)]) {
        [self.delegate cell:self didTapAddButton:self.user];
    }
}






@end
