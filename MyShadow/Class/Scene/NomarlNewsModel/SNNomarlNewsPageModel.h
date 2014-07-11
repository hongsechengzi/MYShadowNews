//
//  SNNomarlNewsPageModel.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  获取数据成功时,执行此 block.
 *
 *  @param array 一个数组,存储给页面新闻对象.
 */
typedef void(^SNNormalPageModelSuccessBlock)(NSArray * headerNewsArray);

/**
 *  获取数据失败时,执行此 block.
 *
 *  @param error 存储有错误信息.
 */
typedef void(^SNNormalPageModelFailBlock)(NSError * error);

@class SNMainMenu;
@interface SNNomarlNewsPageModel : NSObject

/**
 *  获取某个页面的新闻.
 *
 *  @param newsItem   新闻类型.
 *  @param range   要获取的新闻范围,即新闻的起始位置和新闻条数.
 *  @param success 获取数据成功,执行此 block.
 *  @param fail    获取数据失败,执行此 block.
 */
+ (void) nomarlMainMenu: (SNMainMenu *) newsItem
          range: (NSRange) range
        success: (SNNormalPageModelSuccessBlock) success
           fail: (SNNormalPageModelFailBlock) fail;

@end
