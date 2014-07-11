//
//  SNNomarlNewsModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNomarlNewsModel.h"

@interface SNNomarlNewsModel ()
@property (copy, nonatomic) NSString * imgSrc; //!< 主题图片网址.
@property (copy, nonatomic) NSString * title; //!< 新闻标题.
@property (assign, nonatomic) NSUInteger replyCount; //!< 跟帖数.
@property (copy, nonatomic) NSString * docId; //!< 文章唯一标识.
@property (copy,nonatomic) NSString * digest;//!<新闻详情
@property (copy,nonatomic) NSString * tag;//!<cell类型
@property (retain,nonatomic)NSArray * imgExtraArray;//!<额外图片数组

@end

@implementation SNNomarlNewsModel
- (void)dealloc
{
    self.title = nil;
    self.imgSrc = nil;
    self.docId = nil;
    self.digest = nil;
    self.tag = nil;
    self.imgSrc = nil;
#if ! __has_feature(objc_arc)
    [super dealloc];
#endif
}
+ (instancetype) normarlNewsWithImgSrc:(NSString *)imgSrc title:(NSString *)title replyCount:(NSUInteger)replyCount docId:(NSString *)docId digest:(NSString *)digest tag:(NSString *)tag imgExtraArray:(NSArray *)imgExtraArray
{
    SNNomarlNewsModel * model = [[[self class] alloc] initWithImgSrc:imgSrc title:title replyCount:replyCount docId:docId digest:digest tag:tag imgExtraArray:imgExtraArray];
    return SNAutorelease(model);
}

- (instancetype) initWithImgSrc:(NSString *)imgSrc title:(NSString *)title replyCount:(NSUInteger)replyCount docId:(NSString *)docId digest:(NSString *)digest tag:(NSString *)tag imgExtraArray:(NSArray *)imgExtraArray
{
    self = [super init];
    if (self) {
        self.imgSrc = imgSrc;
        self.title = title;
        self.replyCount = replyCount;
        self.docId = docId;
        self.digest = digest;
        self.tag = tag;
        self.imgExtraArray = imgExtraArray;
    }
    return self;
}

@end
