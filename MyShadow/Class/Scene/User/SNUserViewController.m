//
//  SNUserViewController.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNUserViewController.h"
#import "SNUserView.h"
#import "SNLoginViewController.h"

@interface SNUserViewController ()

@end

@implementation SNUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SNUserView * userView = [[SNUserView alloc] initWithFrame:CGRectMake(SCREENWIDTH/6, 0, 5*SCREENWIDTH/6, SCREENHEIGHT)];
    userView.delegate = self;
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.navigationController.navigationBarHidden = YES;
    
    [self.view addSubview:userView];

}
- (void)userViewDidClickButtonAction:(UIButton *)button
{
    NSString * buttonTitle = button.titleLabel.text;
    if ([buttonTitle isEqualToString:@"个人中心"]) {
        
         NSLog(@"进入个人中心页面");
        SNLoginViewController * login = [[SNLoginViewController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
        [login release];
       
    }
    if ([buttonTitle isEqualToString:@"跟帖"]) {
        NSLog(@"进入跟帖页面");
    }
    if ([buttonTitle isEqualToString:@"收藏"]) {
        NSLog(@"进入个收藏页面");
    }
    if ([buttonTitle isEqualToString:@"扫一扫"]) {
        NSLog(@"进入扫一扫页面");
    }
    if ([buttonTitle isEqualToString:@"离线"]) {
        NSLog(@"进入离线页面");
    }
    if ([buttonTitle isEqualToString:@"夜间"]) {
        NSLog(@"进入夜间页面");
    }
    if ([buttonTitle isEqualToString:@"天气"]) {
        NSLog(@"进入天气页面");
    }
    if ([buttonTitle isEqualToString:@"探索"]) {
        NSLog(@"进入探索页面");
    }
    if ([buttonTitle isEqualToString:@"阅读日历"]) {
        NSLog(@"进入阅读日历页面");
    }
    if ([buttonTitle isEqualToString:@"更多"]) {
        NSLog(@"进入更多页面");
    }
    if ([buttonTitle isEqualToString:@"设置"]) {
        NSLog(@"进入设置页面");
    }
    



}
- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
      self.navigationController.navigationBarHidden = YES;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
