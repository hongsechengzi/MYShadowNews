//
//  SNLoginViewController.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNLoginViewController.h"
#import "SNLoginView.h"

@interface SNLoginViewController ()

@end

@implementation SNLoginViewController

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
 SNLoginView * loginView = [[[SNLoginView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.view = loginView;
    loginView.delegate = self;
    self.navigationController.navigationBarHidden = NO;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"登入ShadowNews";
//    UIBarButtonItem * leftBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"02-redo"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickLeftBtnItemAction:)];
//    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    self.navigationController.navigationBar.translucent = NO;
    
//    [leftBtnItem release];
}
#pragma mark  bar左侧栏按钮响应
- (void)didClickLeftBtnItemAction:(UIBarButtonItem *)btnItem
{
    NSLog(@"左侧栏按钮被点击了");


}
#pragma mark  响应登入页面按钮方法
- (void)loginViewDidClickButtonAction:(UIButton *)button
{
    NSString * buttonTitle = button.titleLabel.text;
    if ([buttonTitle isEqualToString:@"忘记密码?"]) {
        NSLog(@"进入忘记密码页面");
    }
    if ([buttonTitle isEqualToString:@"登录"]) {
         NSLog(@"进入登录页面");
    }
    if ([buttonTitle isEqualToString:@"新浪微博登录"]) {
        NSLog(@"进入新浪微博登录页面");
    }
    if ([buttonTitle isEqualToString:@"QQ账号登录"]) {
        NSLog(@"进入QQ账号登录页面");
    }
    if ([buttonTitle isEqualToString:@"没有账号?手机号快速注册"]) {
        NSLog(@"进入没有账号?手机号快速注册页面");
    }
   






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
