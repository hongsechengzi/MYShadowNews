//
//  SNNomarlNewsTV.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNNewsTableView;
@class SNMainMenu;
@interface SNNomarlNewsTV : NSObject<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)NSArray * newsArray;//!<要展示的新闻数组
@property(nonatomic,retain)SNNewsTableView * tableView;

- (void)handlePageDataWithMainMenu:(SNMainMenu *)mianMenu;

- (instancetype)initWithTableView:(SNNewsTableView *)tableView;

@end
