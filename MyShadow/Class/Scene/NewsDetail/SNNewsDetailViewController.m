//
//  SNNewsDetailViewController.m
//  ShadowNews
//
//  Created by 颜风 on 14-7-7.
//  Copyright (c) 2014年 ShadowNews. All rights reserved.
//

#import "SNNewsDetailViewController.h"
#import "SNNewsDetailView.h"
//#import "SNNewsModel.h"
#import "SNNewsDetailModel.h"
#import "SNNewsDetail.h"
//#import "SNNavigationController.h"

@interface SNNewsDetailViewController ()
@property (retain, nonatomic) SNNewsDetail * SNNDDVCDetail; //!< 新闻详情.
@end

@implementation SNNewsDetailViewController
- (instancetype) initWIthDocId: (NSString *) docId
{
    if (self = [super init]) {
        self.docId = docId;
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    SNNewsDetailView * view = [[SNNewsDetailView alloc] init];
    self.view = view;
    SNRelease(view);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 猜测: 可以根据 导航栏的 pop 对手势的默认支持,模拟抽屉效果.
//    UIWebView * webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    NSURL * url = [NSURL URLWithString:@"http://3g.163.com/news/14/0425/01/9QL1TUN00001124J.html"];
//    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url];
//    [webView loadRequest:request];
//    [self.view addSubview:webView];
    
    [SNNewsDetailModel detailModelWithDocId:self.docId success:^(id responseObject) {
        self.SNNDDVCDetail = responseObject;
        self.view.delegate = self;
        self.view.dataSource = self;
        [self.view reloadData];
    } fail:^(NSError *error) {
        // ???:优化方向:网易的"弹窗"会自动消失哦!
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"提示" message: @"网络故障!无法联网获取最新资讯!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if ([self isViewLoaded] && nil == self.view.window) {
        self.view = nil;
    }
}

#pragma mark - 协议方法.
- (SNNewsDetail *)detailInNewsDetailView:(SNNewsDetailView *)newsDetailView
{
    return self.SNNDDVCDetail;
}

@end
