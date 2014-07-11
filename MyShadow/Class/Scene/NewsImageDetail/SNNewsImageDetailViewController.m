//
//  SNNewsImageDetailViewController.m
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNewsImageDetailViewController.h"
#import "SNNewsImageDetailModel.h"
#import "SNNewsImageDetail.h"



@interface SNNewsImageDetailViewController ()

@property (retain, nonatomic) SNNewsImageDetail * imageDetail;

@end

@implementation SNNewsImageDetailViewController

- (instancetype) initWithPhotosetID:(NSString *)photosetID
{
    if (self = [super init]) {
        self.photosetID = photosetID;
    }
    return self;

}
- (void)loadView
{
    self.imageDetailView = [[SNNewsImageDetailView alloc] init];
    self.view = self.imageDetailView;
    //SNRelease(imageDetailView);
}

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
    
   
    
    [SNNewsImageDetailModel imageDetailModelWithPhotosetID:self.photosetID success:^(id responseObject) {
        
        self.imageDetail = responseObject;
        self.imageDetailView.delegate = self;
        self.imageDetailView.dataSource = self;
        [self.imageDetailView reloadData];
        
        
    } fail:^(NSError *error) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"提示" message: @"网络故障!无法联网获取最新资讯!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }];
}

#pragma mark -------协议方法
- (SNNewsImageDetail *)detailInNewsDetailView:(SNNewsImageDetailView *)newsImageDetailView
{
    return self.imageDetail;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
   // self.navigationController.navigationBar.translucent = NO;

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barTintColor = SYSTEM_CLOCK;
    self.navigationController.navigationBar.tintColor = SYSTEM_CLOCK;
   // self.navigationController.navigationBar.translucent = YES;


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
