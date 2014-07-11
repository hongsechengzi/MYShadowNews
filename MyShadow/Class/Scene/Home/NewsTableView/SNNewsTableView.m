//
//  SNNewsTableView.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-7.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNewsTableView.h"
#import "SNHeaderView.h"
#import "MJRefresh.h"

@interface SNNewsTableView ()

@property (copy, nonatomic, readwrite) NSString * title; //!< 新闻板块名称.
//@property (assign, nonatomic, readwrite) BOOL preLoad; //!< 是否是预加载.出于用户体验的考虑,新闻视图可能会预加载某些页面.对于预加载的页面,往往可以暂不发起网络请求,获取最新数据.


@end

@implementation SNNewsTableView

- (void)dealloc
{
    [_footerRefreshView free];
    [_headerRefreshView free];
    self.footerRefreshView = nil;
    self.headerRefreshView = nil;
    self.headerView = nil;
    self.title = nil;
    [super dealloc];
}


+ (instancetype)tableViewPageWithTitle: (NSString *) title
                      preLoad: (BOOL) preLoad
{
    SNNewsTableView * tableViewPage = [[[self class] alloc] initWithTitle: title preLoad:preLoad];
    SNAutorelease(tableViewPage);
    return tableViewPage;
}

// ???:观察下,表视图,触发代理的时机是 moveToWindow,还是movweToSuperView?
// ???:中间的轮转页面,是不是在 moveToSuperView时,触发代理,更合适呢?
- (instancetype)initWithTitle: (NSString *) title
                      preLoad: (BOOL) preLoad
{
    if (self = [super init]) {
        self.title = title;
        self.preLoad = preLoad;
    }
    [self setupSubviews];
    return self;
}

- (void)setupSubviews
{

    self.tableHeaderView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH,SNNewsTableHeaderViewHeight)] autorelease];
    self.tableHeaderView.backgroundColor = [UIColor grayColor];
    self.headerView = [[[SNHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SNNewsTableHeaderViewHeight)] autorelease];

    [self.tableHeaderView addSubview:self.headerView];
    
    self.footerRefreshView = [MJRefreshFooterView footer];
    self.footerRefreshView.scrollView = self;
    self.headerRefreshView = [MJRefreshHeaderView header];
    self.headerRefreshView.scrollView = self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
