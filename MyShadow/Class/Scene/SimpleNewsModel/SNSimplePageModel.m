//
//  SNMilitaryPageModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNSimplePageModel.h"
#import "SNSimpleNewsModel.h"

#import "SNMainMenu.h"
#import "SNDataBase.h"
//#import "YFDataBase.h"
#import "FMDB.h"

@implementation SNSimplePageModel

+ (void)simpleMainMenu:(SNMainMenu *)newsItem rageRange:(NSRange)range success:(SNSimplePageModelSuccessBlock)success fail:(SNSimplePageModelFailBlock)fail

{
     FMDatabase * db = [SNDataBase openDB];
    NSString * urlKey = newsItem.urlKeyStr;
    NSString * urlStr = [NSString stringWithFormat: @"http://c.3g.163.com/nc/article/list/%@/%lu-%lu.html",urlKey,range.location, range.length];
//    NSLog(@"-----urlStr %@",urlStr);
    
    
    
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    [manager GET: urlStr parameters: nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * newsOriginalArray = [responseObject objectForKey: urlKey];
        NSMutableArray * simpleNewsArray = [NSMutableArray arrayWithCapacity: 42];
        [newsOriginalArray enumerateObjectsUsingBlock:^(NSDictionary * newsOriginal, NSUInteger idx, BOOL *stop) {
            
            NSString * imgSrc = [newsOriginal objectForKey: @"imgsrc"];
            NSString * title = [newsOriginal objectForKey: @"title"];
            NSString * publishTime = [newsOriginal objectForKey: @"lmodify"];
            NSInteger replyCount = [(NSNumber *)[newsOriginal objectForKey: @"replyCount"] unsignedIntegerValue];
            NSString * docId = [newsOriginal objectForKey: @"docid"];
            
           
        [db executeUpdate:@"insert into TableNews(title, imgSrc,replyCount,docId,publishTime,urlKey) values(?,?,?,?,?,?)",title,imgSrc,[NSNumber numberWithUnsignedInteger:replyCount],docId,publishTime,urlKey];
            
            [simpleNewsArray addObject:[SNSimpleNewsModel simpleNewsWithImgSrc:imgSrc title:title publishTime:publishTime replyCount:replyCount docId:docId]];
            
        }];
        success(simpleNewsArray);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        fail(error);
    }];
}

@end
