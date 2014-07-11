//
//  SNFirstNewsCell.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNHeaderView : UIView<UIScrollViewDelegate>

@property(nonatomic,retain)NSArray * firstNewsArray;//!<接收新闻数组
@property(nonatomic,retain)UIScrollView * scrollView;//!<头部滚动视图
@property(nonatomic,retain)NSMutableArray * imageArray;//!<回传头部滚动视图图像数组

@end
