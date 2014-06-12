//
//  SHClass.m
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHClass.h"
#import "SHStudent.h"
#import "SHPageImageView.h"
#import "SHHuddle.h"

@interface SHClass ()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *huddles;
@property (strong ,nonatomic) NSMutableArray *students;
@property (strong, nonatomic) NSMutableArray *currentlyOnline;
@property (strong, nonatomic) SHPageImageView *profPic;

@end

@implementation SHClass

@dynamic name;
@dynamic profPic;
@dynamic students;
@dynamic currentlyOnline;
@dynamic huddles;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.profPic = [[SHPageImageView alloc]init];
        self.students = [[NSMutableArray alloc]init];
        self.currentlyOnline = [[NSMutableArray alloc]init];
        self.huddles = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(id)initWithClassTitle:(NSString *)newClassName
{
    self = [super init];
    if(self)
    {
        self.name = newClassName;
        
    }
    
    return self;
}

+ (NSString *)parseClassName
{
    return @"Class";
}

@end
