//
//  SNCategoryModel.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNCategoryModel : NSObject

@property(nonatomic,copy)NSString * imageName;//!<图片名
@property(nonatomic,copy)NSString * title;//!<标题
@property(nonatomic,copy)NSString * urlString;//!<接口

/**
 *  初始化
 *
 *  @param imageName 图标名
 *  @param title     标题
 *  @param urlString 接口
 *
 *  @return 实例对象
 */
- (instancetype)initWithImageName:(NSString *)imageName
                            title:(NSString *)title
                            urlString:(NSString *)urlString;

/**
 *  遍历构造器
 *
 *  @param imageName 图标名
 *  @param title     标题
 *  @param urlString 接口
 *
 *  @return 类对象
 */
+ (instancetype)imageName:(NSString *)imageName
                    title:(NSString *)title
                urlString:(NSString *)urlString;
@end
