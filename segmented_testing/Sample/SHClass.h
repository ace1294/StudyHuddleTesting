//
//  SHClass.h
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import <Parse/Parse.h>
@class SHPageImageView;


@interface SHClass : PFObject <PFSubclassing>



+ (NSString *)parseClassName;

-(id)initWithClassTitle:(NSString *)newClassName;

+ (void)registerSubclass;

@end
