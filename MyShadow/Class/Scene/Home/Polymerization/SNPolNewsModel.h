//
//  SNPolNewsModel.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-2.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNPolNewsModel : NSObject

@property (copy, nonatomic, readonly) NSString * title; //!< 新闻标题.
@property (copy, nonatomic, readonly) NSString * docId; //!< 文章唯一标识.
@property (copy,nonatomic,readonly) NSString * digest;//!<新闻详情

/**
 *  便利构造器.
 *
 *  @param title      新闻标题.
 *  @param docId      文章唯一标识.
 *  @param digest    新闻详情
 *  @return 实例对象.
 */
+ (instancetype) polNewsWithtitle: (NSString *) title
                            docId: (NSString *) docId
                           digest: (NSString *) digest;

/**
 *  便利初始化.
 *
 *  @param title      新闻标题.
 *  @param docId      文章唯一标识.
 *  @param digest    新闻详情
 *  @return 实例对象.
 */
- (instancetype) initWithtitle: (NSString *) title
                         docId: (NSString *) docId
                        digest: (NSString *) digest;
@end
