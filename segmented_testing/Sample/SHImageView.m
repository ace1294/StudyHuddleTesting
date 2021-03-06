//
//  SHImageView.m
//  Sample
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHImageView.h"

@interface SHImageView ()

@property (nonatomic, strong) PFFile *currentFile;
@property (nonatomic, strong) NSString *url;

@end

@implementation SHImageView

@synthesize currentFile,url;
@synthesize placeholderImage;

#pragma mark - PAPImageView

- (void) setFile:(PFFile *)file {
    UIImageView *border = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ShadowsProfilePicture-43.png"]];
    [self addSubview:border];
    
    NSString *requestURL = file.url; // Save copy of url locally (will not change in block)
    [self setUrl:file.url]; // Save copy of url on the instance
    
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];
            if ([requestURL isEqualToString:self.url]) {
                [self setImage:image];
                [self setNeedsDisplay];
            }
        } else {
            NSLog(@"Error on fetching file");
        }
    }];
}

@end
