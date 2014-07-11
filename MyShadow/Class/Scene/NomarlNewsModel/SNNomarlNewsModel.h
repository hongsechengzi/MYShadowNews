//
//  SNNomarlNewsModel.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNNomarlNewsModel : NSObject

@property (copy, nonatomic, readonly) NSString * imgSrc; //!< 主题图片网址.
@property (copy, nonatomic, readonly) NSString * title; //!< 新闻标题.
@property (assign, nonatomic, readonly) NSUInteger replyCount; //!< 跟帖数.
@property (copy, nonatomic, readonly) NSString * publishTime; //!< 发表时间
@property (copy, nonatomic, readonly) NSString * docId; //!< 文章唯一标识.
@property (copy,nonatomic,readonly) NSString * digest;//!<新闻详情
@property (copy,nonatomic,readonly) NSString * tag;//!<cell类型
@property (nonatomic,retain,readonly)NSArray * imgExtraArray;//!<额外图片数组

@property(nonatomic,retain,readonly)NSString * photosetID;
/**
 *  便利构造器.
 *
 *  @param imgSrc     主题图片网址.
 *  @param title      新闻标题.
 *  @param replyCount 跟帖数.
 *  @param docId      文章唯一标识.
 *  @param digest    新闻详情
 *  @param tag        cell图标
 *  @return 实例对象.
 */
+ (instancetype) normarlNewsWithImgSrc: (NSString *) imgSrc
                                title: (NSString *) title
                           replyCount: (NSUInteger) replyCount
                           publishTime:(NSString *) publishTime
                                docId: (NSString *) docId
                               digest: (NSString *) digest
                                  tag: (NSString *)tag
                        imgExtraArray:(NSArray *)imgExtraArray
                           photosetID:(NSString *)photosetID;
/**
 *  便利初始化.
 *
 *  @param imgSrc     主题图片网址.
 *  @param title      新闻标题.
 *  @param replyCount 跟帖数.
 *  @param docId      文章唯一标识.
 *  @param digest    新闻详情
 *  @param tag        cell图标
 *  @param imgExtraArray 额外的图片数组
 *  @return 实例对象.
 */
- (instancetype) initWithImgSrc: (NSString *) imgSrc
                          title: (NSString *) title
                     replyCount: (NSUInteger) replyCount
                    publishTime:(NSString *) publishTime
                          docId: (NSString *) docId
                         digest: (NSString *) digest
                            tag: (NSString *)tag
                  imgExtraArray:(NSArray *)imgExtraArray
                     photosetID:(NSString *)photosetID;

@end
