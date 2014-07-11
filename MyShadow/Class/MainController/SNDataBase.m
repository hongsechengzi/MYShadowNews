//
//  SNDataBase.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-10.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNDataBase.h"
#import "YFDataBase.h"
#import "FMDB.h"

@implementation SNDataBase

static SNDataBase * dataBase = nil;
+ (SNDataBase *)shareInstance
{
    if (nil == dataBase) {
        dataBase = [[SNDataBase alloc] init];
        
    }
    return dataBase;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (nil == dataBase) {
        dataBase = [super allocWithZone:zone];
        return dataBase;
    }
    return nil;
}

static FMDatabase * db = nil;
+ (FMDatabase *)openDB
{

    if (db != nil) {
        return db;
    }
    NSString * documnentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * dbPath = [documnentPath stringByAppendingPathComponent:@"TableNews.sqlite"];
    
    NSLog(@"dbPath = %@",dbPath);
//    db = [[YFDataBase alloc]initWithPath:dbPath];
    
//    db = [FMDatabase databaseWithPath:dbPath];
    db = [[FMDatabase alloc] initWithPath: dbPath];
    
    [db open];
    
    [db executeUpdate:@"CREATE TABLE TableNews (title TEXT NOT NULL, imgSrc TEXT, replyCount TEXT, docId TEXT PRIMARY KEY, digest TEXT, tag TEXT, imgExtraArray TEXT, publishTime TEXT,urlKey TEXT)"];
    
    return db;
}

@end
