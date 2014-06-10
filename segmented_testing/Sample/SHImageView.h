//
//  SHImageView.h
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SHImageView : UIImageView

@property (nonatomic, strong) UIImage *placeholderImage;

- (void) setFile:(PFFile *)file;

@end
