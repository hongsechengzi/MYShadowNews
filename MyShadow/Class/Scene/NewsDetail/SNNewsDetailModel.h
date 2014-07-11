//
//  SNNewsDetailModel.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-9.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  获取数据成功时,执行此 block.
 *
 *  @param array 一个数组,存储本地新闻对象.
 */
typedef void(^SNNewsModelSuccessBlock)(id responseObject);

/**
 *  获取数据失败时,执行此 block.
 *
 *  @param error 存储有错误信息.
 */
typedef void(^SNNewsModelFailBlock)(NSError * error);

@interface SNNewsDetailModel : NSObject


/**
 *  根据新闻唯一标识符获取新闻详情.
 *
 *  @param docId   新闻唯一标识符.
 *  @param success 获取新闻详情成功时执行的 block.
 *  @param fail    获取新闻详情失败时执行的 block.
 */
+ (void) detailModelWithDocId: (NSString *) docId
                      success: (SNNewsModelSuccessBlock) success
                         fail: (SNNewsModelFailBlock) fail;
@end
