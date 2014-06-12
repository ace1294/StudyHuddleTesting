//
//  SHHuddle.m
//  Sample
//
//  Created by Jason Dimitriou on 6/12/14.
//  Copyright (c) 2014 Epic Peaks GmbH. All rights reserved.
//

#import "SHHuddle.h"
#import <Parse/PFObject+Subclass.h>
#import "SHClass.h"
#import "SHPageImageView.h"
#import "SHStudent.h"

@interface SHHuddle ()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *students;
@property (strong, nonatomic) SHClass *class;
@property (strong, nonatomic) SHPageImageView *profPic;

- (void)newStudentAdded:(SHStudent *)newStudent;

@end

@implementation SHHuddle

@dynamic name;
@dynamic students;
@dynamic class;
@dynamic profPic;


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [[NSString alloc] init];
        self.students = [[NSMutableArray alloc]init];
        self.class = [[SHClass alloc]init];
        self.profPic = [[SHPageImageView alloc]init];
    }
    return self;
}

- (id)initWithHuddleName:(NSString *)huddleName members:(NSMutableArray *)members class:(SHClass *)huddleClass pic:(SHPageImageView *)pic
{
    self = [super init];
    if(self)
    {
        self.name = huddleName;
        self.students = members;
        self.class = huddleClass;
        self.profPic = pic;
    }
    
    return self;
}

- (void)addStudent:(SHStudent *)newStudent
{
    [self.students addObject:newStudent];
    
    //send request to new student
}

- (void)newStudentAdded:(SHStudent *)newStudent
{
    //send notification to current members that the newStudent accepted the request
}



+ (NSString *)parseClassName
{
    return @"Huddle";
}

@end
