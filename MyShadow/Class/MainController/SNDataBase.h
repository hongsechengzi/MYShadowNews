//
//  SNDataBase.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-10.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;
@interface SNDataBase : NSObject

+ (SNDataBase *)shareInstance;

+ (FMDatabase *)openDB;

@end
