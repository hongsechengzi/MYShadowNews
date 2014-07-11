//
//  SNCategoryPageModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNCategoryPageModel.h"
#import "SNCategoryModel.h"

@implementation SNCategoryPageModel

+ (NSDictionary *)categoryDic
{
    //新闻
    SNCategoryModel * news = [SNCategoryModel imageName:@"01-refresh" title:@"新闻" urlString:@"http://c.3g.163.com/nc/article/headline/T1348647909107/0-20.html"];
    //订阅
    SNCategoryModel * subscribe = [SNCategoryModel imageName:@"01-refresh" title:@"订阅" urlString:@""];
    //图片
    SNCategoryModel * picture = [SNCategoryModel imageName:@"01-refresh" title:@"图片" urlString:@""];
    //视频
    SNCategoryModel * video = [SNCategoryModel imageName:@"01-refresh" title:@"视频" urlString:@""];
    //跟帖
    SNCategoryModel * follow = [SNCategoryModel imageName:@"01-refresh" title:@"跟帖" urlString:@""];
    //电台
    SNCategoryModel * radio = [SNCategoryModel imageName:@"01-refresh" title:@"电台" urlString:@""];
    
    NSDictionary * dic = @{@"新闻": news,
                           @"订阅":subscribe,
                           @"图片":picture,
                           @"视频":video,
                           @"跟帖":follow,
                           @"电台":radio};
    return dic;
}

@end
