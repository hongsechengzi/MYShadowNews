//
//  SNMainMenu.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNMainMenu.h"

@interface SNMainMenu ()

@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * urlKeyStr;
@property(nonatomic,retain)NSString * url;
@property(nonatomic,retain)NSString * pageKey;

@end

@implementation SNMainMenu

- (void)dealloc
{
    self.title = nil;
    self.urlKeyStr = nil;
    self.url = nil;
    self.pageKey = nil;
    [super dealloc];
}
- (instancetype)initWithTitle:(NSString *)title urlKeyStr:(NSString *)urlkeyStr url:(NSString *)url pageKey:(NSString *)pageKey
{
    self = [super init];
    if (self) {
        self.title = title;
        self.urlKeyStr = urlkeyStr;
        self.url = url;
        self.pageKey = pageKey;
    }
    return self;
}

+ (instancetype)mainMenuTitle:(NSString *)title urlKeyStr:(NSString *)urlkeyStr url:(NSString *)url pageKey:(NSString *)pageKey
{
    SNMainMenu * mainMenu = [[SNMainMenu alloc] initWithTitle:title urlKeyStr:urlkeyStr url:url pageKey:pageKey];
    return SNAutorelease(mainMenu);
}



@end
