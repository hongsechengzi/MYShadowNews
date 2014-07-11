//
//  SNHeaderNewsTV.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-7.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNHeaderNewsTV.h"
#import "SNHeaderPageModel.h"
#import "SNHeaderView.h"
#import "SNNewsTableView.h"
#import "MJRefresh.h"

//#import "SNNomarlNewsModel.h"
//#import "SNShowImageCell.h"
//#import "SNNormalNewsCell.h"
//
//#import "SNNewsTableView.h"
//#import "SNMainMenu.h"
//#import "SNNomarlNewsPageModel.h"
//#import "SNHeaderView.h"
//#import "MJRefresh.h"

@implementation SNHeaderNewsTV

//- (void)dealloc
//{
//    self.newsArray = nil;
//    [super dealloc];
//}
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


//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    NSLog(@"normal :[self.newsArray count] = %ld",[self.newsArray count]);
//    
//    return [self.newsArray count];
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    SNNomarlNewsModel * news = [self.newsArray objectAtIndex:indexPath.row];
//    
//    if (nil != news.imgExtraArray) {
//        static NSString * imageIdentifier = @"imageCell";
//        SNShowImageCell * cell =  [tableView dequeueReusableCellWithIdentifier:imageIdentifier];
//        if (!cell) {
//            cell = [[[SNShowImageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:imageIdentifier] autorelease];
//        }
//        cell.news = news;
//        return cell;
//    }
//    static NSString * identifier = @"normalCell";
//    SNNormalNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[[SNNormalNewsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
//    }
//    cell.news = news;
//    
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    SNNomarlNewsModel * news = [self.newsArray objectAtIndex:indexPath.row];
//    if (nil != news.imgExtraArray) {
//        return 100;
//    }
//    return 70;
//}
- (void)handleHeaderPageData
{
    [SNHeaderPageModel  header:@"头条" range:NSMakeRange(0, 20) success:^(NSArray *headerNewsArray) {
        self.newsArray = headerNewsArray;
        self.tableView.headerView.firstNewsArray = self.newsArray;
    
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    self.tableView.footerRefreshView.beginRefreshingBlock = ^(MJRefreshBaseView * refreshView){
     NSInteger  startRecord = self.newsArray.count;
        [SNHeaderPageModel  header:@"头条" range:NSMakeRange(startRecord, 20) success:^(NSArray *headerNewsArray) {
            
            NSMutableArray * arr = [NSMutableArray arrayWithArray:self.newsArray];
            if ([[arr lastObject] isEqual:[headerNewsArray firstObject]]) {
                [arr removeObject:arr.lastObject];
            }
            [arr addObjectsFromArray:headerNewsArray];
            self.newsArray = (NSMutableArray *)arr;
            self.tableView.headerView.firstNewsArray = self.newsArray;
            [self.tableView.footerRefreshView endRefreshing];
            [self.tableView reloadData];

        } fail:^(NSError *error) {
            NSLog(@"error = %@",error);
        }];
    };
    
     self.tableView.headerRefreshView.beginRefreshingBlock = ^(MJRefreshBaseView * refreshView){
         [SNHeaderPageModel  header:@"头条" range:NSMakeRange(0, 20) success:^(NSArray *headerNewsArray) {
             self.newsArray = headerNewsArray;
             self.tableView.headerView.firstNewsArray = self.newsArray;
             [self.tableView.headerRefreshView endRefreshing];
             [self.tableView reloadData];
         } fail:^(NSError *error) {
             NSLog(@"error = %@",error);
         }];
     };
    
}

@end
