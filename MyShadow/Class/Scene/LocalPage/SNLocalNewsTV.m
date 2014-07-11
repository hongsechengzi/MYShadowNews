//
//  SNLocalNewsTV.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNLocalNewsTV.h"
#import "SNLocalNewsModel.h"

#import "SNLocalPageModel.h"

#import "SNHeaderView.h"
#import "MJRefresh.h"

#import "SNNewsTableView.h"

#import "SNTimeCell.h"
#import "SNSimpleNewsCell.h"
#import "SNMainMenu.h"
#import "SNNewsDetailViewController.h"
#import "SNMainController.h"

@implementation SNLocalNewsTV
- (void)dealloc
{
    self.newsArray = nil;
    [super dealloc];
}

- (instancetype)initWithTableView:(SNNewsTableView *)tableView
{
    self = [super init];
    if (self) {
        self.tableView = tableView;
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.newsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SNSimpleNewsModel * news = [self.newsArray objectAtIndex:indexPath.row];
    
    static NSString * identifier = @"timeCell";
    SNTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[SNTimeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
    }
    cell.news = news;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 70;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SNLocalNewsModel * news = [self.newsArray objectAtIndex:indexPath.row];
    
    NSString * docId = news.docId;
    
    SNNewsDetailViewController * detailVC = [[SNNewsDetailViewController alloc] initWIthDocId:docId];
    [[SNMainController sharedInstance].navController pushViewController:detailVC animated: YES];
}


- (void)handlePageDataWithMainMenu:(SNMainMenu *)mianMenu
{
    [SNLocalPageModel local:@"北京" range:NSMakeRange(0, 20) success:^(NSArray *localNewsArray) {
        self.newsArray = localNewsArray;
        self.tableView.headerView.firstNewsArray = self.newsArray;
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
    self.tableView.footerRefreshView.beginRefreshingBlock = ^(MJRefreshBaseView * refreshView){
        NSInteger  startRecord = self.newsArray.count;
        [SNLocalPageModel local:@"北京" range:NSMakeRange(startRecord, 20) success:^(NSArray *localNewsArray) {
            NSMutableArray * arr = [NSMutableArray arrayWithArray:self.newsArray];
            if ([[arr lastObject] isEqual:[localNewsArray firstObject]]) {
                [arr removeObject:arr.lastObject];
            }
            [arr addObjectsFromArray:localNewsArray];
            self.newsArray = (NSMutableArray *)arr;
            self.tableView.headerView.firstNewsArray = self.newsArray;
            [self.tableView.footerRefreshView endRefreshing];
            [self.tableView reloadData];

        } fail:^(NSError *error) {
            NSLog(@"error = %@",error);
        }];

    };
    self.tableView.headerRefreshView.beginRefreshingBlock = ^(MJRefreshBaseView * refreshView){
        [SNLocalPageModel local:@"北京" range:NSMakeRange(0, 20) success:^(NSArray *localNewsArray) {
            self.newsArray = localNewsArray;
            self.tableView.headerView.firstNewsArray = self.newsArray;
            [self.tableView.headerRefreshView endRefreshing];
            [self.tableView reloadData];
        } fail:^(NSError *error) {
            NSLog(@"error = %@",error);
        }];
    };
}




@end
