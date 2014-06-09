//
//  AppDelegate.m
//  Sample
//
//  Created by Ignacio Romero Zurbuchen on 3/4/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MasterViewController.h"
#import "ChildViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    MasterViewController* masterViewController = [[ChildViewController alloc]init];
    
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    self.window.rootViewController = masterViewController;
    
    [self.window makeKeyAndVisible];

    return YES;
}

@end
