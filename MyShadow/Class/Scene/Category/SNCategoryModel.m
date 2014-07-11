//
//  SNCategoryModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNCategoryModel.h"

@implementation SNCategoryModel
- (void)dealloc
{
    self.title = nil;
    self.imageName = nil;
    self.urlString = nil;
    [super dealloc];
}
- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title urlString:(NSString *)urlString
{
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.title = title;
        self.urlString = urlString;
    }
    return self;
}

+(instancetype)imageName:(NSString *)imageName title:(NSString *)title urlString:(NSString *)urlString
{
    SNCategoryModel * model = [[SNCategoryModel alloc] initWithImageName:imageName title:title urlString:urlString];
    return SNAutorelease(model);
}



@end
