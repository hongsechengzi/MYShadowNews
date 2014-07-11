//
//  SNHeaderPageModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-2.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNHeaderPageModel.h"
#import "SNNomarlNewsModel.h"

@implementation SNHeaderPageModel

+ (void) header: (NSString *) newsItem
         range: (NSRange) range
       success: (SNHeaderPageModelSuccessBlock) success
          fail: (SNHeaderPageModelFailBlock) fail
{
    NSDictionary * newsItemDic = @{@"头条": @"T1348647909107"};
    NSString * urlKey = [newsItemDic objectForKey:newsItem];
    NSString * urlStr = [NSString stringWithFormat: @"http://c.3g.163.com/nc/article/headline/%@/%lu-%lu.html",urlKey , range.location, range.length];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    
    [manager GET: urlStr parameters: nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * newsOriginalArray = [responseObject objectForKey: urlKey];
        NSMutableArray * headerNewsArray = [NSMutableArray arrayWithCapacity: 42];
        
        [newsOriginalArray enumerateObjectsUsingBlock:^(NSDictionary * newsOriginal, NSUInteger idx, BOOL *stop) {
            NSString * imgSrc = [newsOriginal objectForKey: @"imgsrc"];
            NSString * title = [newsOriginal objectForKey: @"title"];
            NSUInteger replyCount = [(NSNumber *)[newsOriginal objectForKey: @"replyCount"] unsignedIntegerValue];
            NSString * docId = [newsOriginal objectForKey: @"docid"];
            NSString * digest = [newsOriginal objectForKey:@"digest"];
            NSString * tag = [newsOriginal objectForKey:@"TAG"];
            
            NSArray * imgExtraArray = [newsOriginal objectForKey:@"imgextra"];
            [headerNewsArray addObject:[SNNomarlNewsModel normarlNewsWithImgSrc:imgSrc title:title replyCount:replyCount docId:docId digest:digest tag:tag imgExtraArray:imgExtraArray]];
        }];
        success(headerNewsArray);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        fail(error);
    }];
}


@end
