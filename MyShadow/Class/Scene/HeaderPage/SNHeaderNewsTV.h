//
//  SNHeaderNewsTV.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-7.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNomarlNewsTV.h"


@interface SNHeaderNewsTV : SNNomarlNewsTV

@property(nonatomic,retain)NSArray * newsArray;//!<要展示的新闻数组
@property(nonatomic,retain)SNNewsTableView * tableView;

- (void)handleHeaderPageData;

- (instancetype)initWithTableView:(SNNewsTableView *)tableView;
@end
