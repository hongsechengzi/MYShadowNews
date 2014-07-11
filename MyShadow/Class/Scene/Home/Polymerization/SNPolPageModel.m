//
//  SNPolPageModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-2.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNPolPageModel.h"
#import "SNPolNewsModel.h"
//#import "AFNetworking.h"

@implementation SNPolPageModel

+ (void) polPageSuccess:(SNPolPageModelSuccessBlock) successBolck
                   fail:(SNPolPageModelFailBlock)failBlock
{
    NSString * urlString = @"http://c.3g.163.com/nc/tag/v2/list/all.html";
    NSArray * polItemsArr =  @[@"新闻NEWS",@"体育SPORTS",@"财经MONEY",@"科技TECHNOLOGY",@"娱乐ENTERTAINMENT"];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * newsOriginalArray = responseObject ;
        
        NSMutableDictionary * polDic = [NSMutableDictionary dictionaryWithCapacity:42];
        
      
      __block  int j = 0;
        [newsOriginalArray enumerateObjectsUsingBlock:^(NSDictionary * newsOriginal , NSUInteger idx, BOOL *stop) {
            NSMutableArray * polNewsArray = [NSMutableArray arrayWithCapacity:42];
            for (int i = 1; i <= 4 ; i ++){
            NSArray * newsArray = [newsOriginal objectForKey:[NSString stringWithFormat:@"%d",i]];
              [newsArray enumerateObjectsUsingBlock:^(NSDictionary * newsDic, NSUInteger idx, BOOL *stop) {
                  NSString * title = [newsDic objectForKey:@"name"];
                  NSString * docID = [newsDic objectForKey:@"id"];
                  NSString * digest = [newsDic objectForKey:@"doctitle"];
                [polNewsArray addObject:[SNPolNewsModel polNewsWithtitle:title docId:docID digest:digest]];
                  
              }];
                
                NSInteger a = polNewsArray.count-1;
                for (int i = 0; i < a; i++) {
                    int b = arc4random()%a;
                    [polNewsArray exchangeObjectAtIndex:b withObjectAtIndex:a];
                }
          //  NSLog(@"news aa = %@",polNewsArray);
                [polDic setObject:polNewsArray forKey:polItemsArr[j]];
        }
           // NSLog(@"----");
            j++;
           
        }];
        successBolck(polDic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failBlock(error);
    }];
}

@end
