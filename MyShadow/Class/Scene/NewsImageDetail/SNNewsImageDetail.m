//
//  SNNewsImageDetail.m
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNewsImageDetail.h"

@interface SNNewsImageDetail ()

@property(nonatomic,retain,readwrite)NSArray * photos;
@property(nonatomic,retain,readwrite)NSString * setName;

@end

@implementation SNNewsImageDetail

+ (instancetype)imageDetailWithPhotos:(NSArray *)photos setName:(NSString *)setName
{
    SNNewsImageDetail * model = [[SNNewsImageDetail alloc] initWithPhotos:photos setName:setName];
    
    return SNAutorelease(model);
}
- (instancetype)initWithPhotos:(NSArray *)photos setName:(NSString *)setName
{
    if (self = [super init]) {
        self.photos = photos;
        self.setName = setName;
    }
    return self;
}
@end
