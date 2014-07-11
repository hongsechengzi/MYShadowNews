//
//  SNCategoryViewController.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNCategoryViewController.h"
#import "SNCategoryView.h"
#import "SNCategoryPageModel.h"


@interface SNCategoryViewController ()

@end

@implementation SNCategoryViewController

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
    // Do any additional setup after loading the view.
    
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    SNCategoryView * categoryView = [[SNCategoryView alloc] initWithFrame:CGRectMake(0, 0, 3*width/5, height)];
    [self.view addSubview: categoryView];
    categoryView.categoryDic = [SNCategoryPageModel categoryDic];
    categoryView.delegate = self;

    
}
- (void)categoryViewDidClickButtonAction:(UIButton *)button
{
    
  NSLog(@"button.titleLabel.text %@",button.titleLabel.text);
    NSString * categoryName = button.titleLabel.text;
    NSDictionary * dic = [SNCategoryPageModel categoryDic];
    
    NSArray * titleArray = [dic allKeys];
    for (NSString * titleName in titleArray) {
        if ([categoryName isEqualToString:titleName]) {
          //  SNCategoryView * category = [dic objectForKey:categoryName];
        // !!!:  未完成:实现跳转到各个页面
            
            
        
            NSLog(@"%@",categoryName);
            
        }
    }
    
    
    
    
//    if ([categoryName isEqualToString:@"新闻"]) {
//        
//        NSLog(@"进入新闻界面");
//        
//    };
//    if ([categoryName isEqualToString:@"订阅"]) {
//         NSLog(@"进入订阅界面");
//        
//        
//    };
//    if ([categoryName isEqualToString:@"图片"]) {
//         NSLog(@"进入图片界面");
//        
//    };
//    if ([categoryName isEqualToString:@"视频"]) {
//         NSLog(@"进入视频界面");
//        
//    };
//    if ([categoryName isEqualToString:@"跟帖"]) {
//         NSLog(@"进入跟帖界面");
//        
//    };
//    if ([categoryName isEqualToString:@"电台"]) {
//         NSLog(@"进入电台界面");
//        
//    };
    
    
    

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
