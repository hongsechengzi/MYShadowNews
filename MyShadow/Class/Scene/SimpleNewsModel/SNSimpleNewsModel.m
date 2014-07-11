//
//  SNSimpleNewsModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNSimpleNewsModel.h"

@interface SNSimpleNewsModel ()

#pragma mark - 属性.
@property (copy, nonatomic, readwrite) NSString * imgSrc; //!< 主题图片网址.
@property (copy, nonatomic, readwrite) NSString * title; //!< 新闻标题.
@property (copy, nonatomic, readwrite) NSString * publishTime; //!< 发表时间.
@property (assign, nonatomic, readwrite) NSUInteger replyCount; //!< 跟帖数.
@property (copy, nonatomic, readwrite) NSString * docId; //!< 文章唯一标识.

@end


@implementation SNSimpleNewsModel



#pragma mark - 实例方法.
- (void)dealloc
{
    self.imgSrc = nil;
    self.title = nil;
    self.publishTime = nil;
    self.docId = nil;
    [super dealloc];
}

+ (instancetype) simpleNewsWithImgSrc:(NSString *)imgSrc title:(NSString *)title publishTime:(NSString *)pulishTime replyCount:(NSUInteger)replyCount docId:(NSString *)docId
{
    SNSimpleNewsModel * model = [[[self class] alloc] initWithImgSrc: imgSrc title: title publishTime: pulishTime replyCount: replyCount docId: docId];
    return SNAutorelease(model);
}

/**
 *  便利初始化.
 *
 *  @param imgSrc     主题图片网址.
 *  @param title      新闻标题.
 *  @param pulishTime 发表时间.
 *  @param replyCount 跟帖数.
 *  @param docId      文章唯一标识.
 *
 *  @return 实例对象.
 */
- (instancetype) initWithImgSrc: (NSString *) imgSrc
                          title: (NSString *) title
                    publishTime: (NSString *) pulishTime
                     replyCount: (NSUInteger) replyCount
                          docId: (NSString *) docId
{
    if (self = [super init]) {
        self.imgSrc = imgSrc;
        self.title = title;
        self.publishTime = pulishTime;
        self.replyCount = replyCount;
        self.docId = docId;
    }
    return self;
}

@end
