//
//  SNNewsDetailModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-9.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNewsDetailModel.h"
#import "AFNetworking.h"
#import "SNNewsDetail.h"


@implementation SNNewsDetailModel

+ (void) detailModelWithDocId: (NSString *) docId
                      success: (SNNewsModelSuccessBlock) success
                         fail: (SNNewsModelFailBlock) fail
{
    NSString * urlStr = [NSString stringWithFormat: @"http://c.3g.163.com/nc/article/%@/full.html", docId];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    [manager GET: urlStr parameters: nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * detailNews = [responseObject objectForKey: docId];
        NSString * title = [detailNews objectForKey: @"title"];
        NSString * source = [detailNews objectForKey: @"source"];
        NSString * publishTime = [detailNews objectForKey: @"ptime"];
        NSUInteger replyCount = [[detailNews objectForKey: @"replyCount"] unsignedIntegerValue];
        NSString * sourceUrl = [detailNews objectForKey: @"source_url"];
        NSString * templateType= [detailNews objectForKey: @"template"];
        NSString * body = [detailNews objectForKey: @"body"];
        NSArray * imgArray = [detailNews objectForKey:@"img"];
        NSArray * videoArray = [detailNews objectForKey:@"video"];
        
        NSString * photoStr = [detailNews objectForKey:@"photosetID"];
        NSArray * photoArray = [photoStr componentsSeparatedByString:@"|"];
        NSString * photosetID = [photoArray lastObject];
       
        success([SNNewsDetail detailWithDocId: docId title: title source: source publishTime: publishTime replyCount: replyCount sourceUrl: sourceUrl templateType: templateType body: body imgArray:imgArray videoArray:videoArray photosetID:photosetID]);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        fail(error);
    }];
    
}

@end
