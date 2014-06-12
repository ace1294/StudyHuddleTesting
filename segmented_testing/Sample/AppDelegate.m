//
//  AppDelegate.m
//  Sample
//
//  Created by Ignacio Romero Zurbuchen on 3/4/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "ChildViewController.h"
#import "SHStudent.h"
#import "SHClass.h"
#import "SHHuddle.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [SHClass registerSubclass];
    [SHStudent registerSubclass];
    [SHHuddle registerSubclass];
    
    [Parse setApplicationId:@"tYVLuBAkB3oeGEo8dQa0mQdW8AfyppZHI92DKvTk"
                  clientKey:@"BZ4boxrBIGK0dJKV47r7hVJ4D4C9bSensOhR46kN"];
    
    
    MasterViewController* masterViewController = [[MasterViewController alloc]init];
    
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    self.window.backgroundColor = [UIColor grayColor];
    self.window.rootViewController = masterViewController;
    
    [self.window makeKeyAndVisible];

    return YES;
}

@end
