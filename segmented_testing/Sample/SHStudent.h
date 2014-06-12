//
//  SHStudent.h
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <Parse/Parse.h>
@class SHHuddle;
@class SHClass;
@class SHPageImageView;

@interface SHStudent : PFObject <PFSubclassing>



+ (NSString *)parseClassName;

- (id)initWithParseUser:(PFUser *)user;
- (NSInteger)addHuddle:(SHHuddle *)newHuddle;
- (NSInteger)addClass:(SHClass *)newClass;

+ (void)registerSubclass;;

@end
