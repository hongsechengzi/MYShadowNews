//
//  SNMainController.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNMainController.h"
#import "SNNewsViewController.h"

#import "SNMainMenuModel.h"
#import "YRSideViewController.h"

#import "SNCategoryViewController.h"
#import "SNUserViewController.h"

@implementation SNMainController

static SNMainController * handle = nil;
+ (instancetype)sharedInstance
{
    if (nil == handle) {
      handle =  [[self alloc] init];
    }
    return handle;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (nil == handle) {
        handle = [super allocWithZone:zone];
        return handle;
    }
    return nil;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        SNNewsViewController * newsVC = [[SNNewsViewController alloc] init];
        self.newsVC = newsVC;
        [newsVC release];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:newsVC];
        
        self.navController = nav;       
        [nav release];       
    }
    return self;
}

@end
