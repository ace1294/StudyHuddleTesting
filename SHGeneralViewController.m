//
//  SHGeneralViewController.m
//  GeneralLayout
//
//  Created by Jason Dimitriou on 6/9/14.
//  Copyright (c) 2014 StudyHuddle. All rights reserved.
//

#import "SHGeneralViewController.h"
#import "SHSegmentedViewController.h"


@interface SHGeneralViewController ()

@property (nonatomic, strong) SHSegmentedViewController *segmentedControl;

@end

@implementation SHGeneralViewController

- (id)init
{
    if(self = [super init])
    {
        _segmentedControl = [[SHSegmentedViewController alloc] init];
    }
    
    return self;
}

- (void) loadView
{
    
}

- (void) viewDidLoad
{
    [self.view addSubview:self.segmentedControl.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
