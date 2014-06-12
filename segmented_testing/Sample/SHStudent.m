//
//  SHStudent.m
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHStudent.h"
#import "SHPageImageView.h"
#import "SHHuddle.h"
#import "SHRequestCell.h"
#import "SHClass.h"

@interface SHStudent ()

@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *major;
@property (strong, nonatomic) NSMutableArray *huddles;
@property (strong ,nonatomic) NSMutableArray *classes;
@property (strong, nonatomic) NSMutableArray *requests;
@property (strong, nonatomic) SHPageImageView *profPic;

@end

@implementation SHStudent

@dynamic name;
@dynamic major;
@dynamic user;
@dynamic huddles;
@dynamic classes;
@dynamic requests;
@dynamic profPic;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.user = [[PFUser alloc] init];
        self.profPic = [[SHPageImageView alloc]init];
        self.huddles = [[NSMutableArray alloc]init];
        self.classes = [[NSMutableArray alloc]init];
        self.requests = [[NSMutableArray alloc]init];
        
    }
    return self;
}

- (id)initWithParseUser:(PFUser *)user
{
    self = [super init];
    if(self)
    {
        self.user = user;
        self.name = user.username;
    }
    return self;
}


- (NSInteger)addHuddle:(SHHuddle *)newHuddle
{
    [self.huddles addObject:newHuddle];
    return [self.huddles count];
}

- (NSInteger)addClass:(SHClass *)newClass
{
    [self.classes addObject:newClass];
    return [self.classes count];
}

+ (NSString *)parseClassName
{
    return @"Student";
}

@end
