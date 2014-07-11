//
//  SNPolNewsModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-2.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNPolNewsModel.h"

@interface SNPolNewsModel ()

@property (copy, nonatomic) NSString * title; //!< 新闻标题.
@property (copy, nonatomic) NSString * docId; //!< 文章唯一标识.
@property (copy,nonatomic) NSString * digest;//!<新闻详情


@end
@implementation SNPolNewsModel
- (void)dealloc
{
    RELEASE_SAFELY(_docId);
    RELEASE_SAFELY(_title);
    RELEASE_SAFELY(_digest);
    [super dealloc];
}

+ (instancetype)polNewsWithtitle:(NSString *)title docId:(NSString *)docId digest:(NSString *)digest
{
    SNPolNewsModel * model = [[SNPolNewsModel alloc] initWithtitle:title docId:docId digest:digest];
    return SNAutorelease(model);
}
- (instancetype)initWithtitle:(NSString *)title docId:(NSString *)docId digest:(NSString *)digest
{
    self = [super init];
    if (self) {
        self.title = title;
        self.docId = docId;
        self.digest = digest;
    }
    return self;

}
@end
