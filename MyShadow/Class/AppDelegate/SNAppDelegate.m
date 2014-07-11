//
//  SNAppDelegate.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNAppDelegate.h"
#import "SNMainController.h"

#import "YRSideViewController.h"
#import "SNCategoryViewController.h"
#import "SNUserViewController.h"
#import "SNNewsViewController.h"

@implementation SNAppDelegate
- (void)dealloc
{
    RELEASE_SAFELY(_window);
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    self.sideViewController = [[YRSideViewController alloc] initWithNibName:nil bundle:nil];
    SNCategoryViewController * categoryVC = [[SNCategoryViewController alloc] init];
    SNUserViewController  * userVC = [[SNUserViewController alloc] init];
    self.sideViewController.rootViewController = [[SNMainController sharedInstance] navController];
    self.sideViewController.leftViewController = categoryVC;
    self.sideViewController.rightViewController = userVC;
    self.sideViewController.leftViewShowWidth = 200;
    self.sideViewController.needSwipeShowMenu = false;
    self.window.rootViewController = self.sideViewController;
    
    [self.sideViewController setRootViewMoveBlock:^(UIView *rootView, CGRect orginFrame, CGFloat xoffset) {
        //使用简单的平移动画
        rootView.frame=CGRectMake(xoffset, orginFrame.origin.y, orginFrame.size.width, orginFrame.size.height);
    }];

    
   //self.window.rootViewController = [[SNMainController sharedInstance] navController];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
