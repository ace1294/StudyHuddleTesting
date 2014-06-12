//
//  SHHuddle.h
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <Parse/Parse.h>
@class SHClass;
@class SHPageImageView;
@class SHStudent;

@interface SHHuddle : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

- (id)initWithHuddleName:(NSString *)huddleName
                 members:(NSMutableArray *)members
                   class:(SHClass *)huddleClass
                     pic:(SHPageImageView *)pic;

- (void)addStudent:(SHStudent *)newStudent;

+ (void)registerSubclass;




@end
