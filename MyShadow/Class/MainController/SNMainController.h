//
//  SNMainController.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SNNewsViewController;


@interface SNMainController : NSObject
@property(nonatomic,retain)UINavigationController * navController;
@property(nonatomic,retain)SNNewsViewController * newsVC;
@property(nonatomic,retain)UIScrollView * scrollView;
+ (instancetype)sharedInstance;

@end
