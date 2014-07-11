//
//  SNNewsImageDetail.h
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNNewsImageDetail : NSObject

@property(nonatomic,retain,readonly)NSArray * photos;
@property(nonatomic,retain,readonly)NSString * setName;

- (instancetype) initWithPhotos:(NSArray *)photos setName:(NSString *)setName;
+ (instancetype) imageDetailWithPhotos:(NSArray *)photos setName:(NSString *)setName;


@end
