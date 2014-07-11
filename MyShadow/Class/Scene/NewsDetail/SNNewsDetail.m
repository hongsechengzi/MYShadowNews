//
//  SNNewsDetail.m
//  ShadowNews
//
//  Created by 颜风 on 14-7-7.
//  Copyright (c) 2014年 ShadowNews. All rights reserved.
//

#import "SNNewsDetail.h"
@interface SNNewsDetail ()
@property (copy, nonatomic, readwrite) NSString * title;
@property (copy, nonatomic, readwrite) NSString * source;
@property (copy, nonatomic, readwrite) NSString * publishTime;
@property (assign, nonatomic, readwrite) NSUInteger replyCount;
@property (copy, nonatomic, readwrite) NSString * sourceUrl;
@property (copy, nonatomic, readwrite) NSString * templateType;
@property (copy, nonatomic, readwrite) NSString * body;
@property (copy, nonatomic, readwrite) NSString * docId;
@property (retain,nonatomic,readwrite) NSArray * imgArray;//!<图片数组.
@property (retain,nonatomic,readwrite) NSArray * videoArray;
@property (retain,nonatomic,readwrite) NSString * photosetID;
@end

@implementation SNNewsDetail
+ (instancetype) detailWithDocId: (NSString *) docId
                           title: (NSString *) title
                          source: (NSString *) source
                     publishTime: (NSString *) publishTime
                      replyCount: (NSUInteger) replyCount
                       sourceUrl: (NSString *) sourceUrl
                    templateType: (NSString *) templateType
                            body: (NSString *) body
                        imgArray:(NSArray *)imgArray videoArray:(NSArray *)videoArray photosetID:(NSString *)photosetID
{
    SNNewsDetail * detail = [[[self class] alloc]initWithDocId:docId title: title source:source publishTime:publishTime replyCount:replyCount sourceUrl: sourceUrl templateType: templateType body:body imgArray:imgArray videoArray:videoArray photosetID:photosetID] ;
    SNAutorelease(detail);
    return detail;
}
- (instancetype) initWithDocId: (NSString *) docId
                         title: (NSString *) title
                        source: (NSString *) source
                   publishTime: (NSString *) publishTime
                    replyCount: (NSUInteger) replyCount
                     sourceUrl: (NSString *) sourceUrl
                  templateType: (NSString *) templateType
                          body: (NSString *) body
                      imgArray:(NSArray *)imgArray videoArray:(NSArray *)videoArray photosetID:(NSString *)photosetID
{
    if (self = [super init]) {
        self.docId = docId;
        self.title = title;
        self.source = source;
        self.publishTime = publishTime;
        self.replyCount = replyCount;
        self.sourceUrl = sourceUrl;
        self.templateType = templateType;
        self.imgArray = imgArray;
        self.body = body;
        self.videoArray = videoArray;
        self.photosetID = photosetID;
    }
    
    return self;
}
@end
