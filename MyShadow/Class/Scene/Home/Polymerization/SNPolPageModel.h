//
//  SNPolPageModel.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-2.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  获取数据成功时,执行此 block.
 *
 *  @param array 一个数组,存储给页面新闻对象.
 */
typedef void(^SNPolPageModelSuccessBlock)(NSDictionary * polDic);
/**
 *  获取数据失败时,执行此 block.
 *
 *  @param error 存储有错误信息.
 */
typedef void(^SNPolPageModelFailBlock)(NSError * error);

@interface SNPolPageModel : NSObject
/**
 *  获取聚合页面的新闻.
 *
 *  @param success 获取数据成功,执行此 block.
 *  @param fail    获取数据失败,执行此 block.
 */
+ (void) polPageSuccess:(SNPolPageModelSuccessBlock) successBolck
                   fail:(SNPolPageModelFailBlock)failBlock;

@end
