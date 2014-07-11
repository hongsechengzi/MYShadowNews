//
//  SNUserView.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNUserView.h"

@implementation SNUserView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews
{
    CGFloat height = self.bounds.size.height;
  //  CGFloat width = self.bounds.size.width;
  //  self.backgroundColor = [UIColor yellowColor];
    
    /*
    UIView * loginView = [[UIView alloc] initWithFrame:CGRectMake(30, 20, 200, 250)];
    loginView.backgroundColor = [UIColor redColor];
    [self addSubview:loginView];
    [loginView release];
    
    UIImageView * loginIcon = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    loginIcon.image = [UIImage imageNamed:@"12-eye"];
    loginIcon.center = CGPointMake(100, 100);
    [loginView addSubview:loginIcon];
    [loginIcon release];
   
    UILabel * loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 120, 30)];
    loginLabel.center = CGPointMake(110, 150);
    loginLabel.text = @"立即登录";
    loginLabel.font = [UIFont systemFontOfSize:24];
    [loginView addSubview:loginLabel];
    [loginLabel release];
    */
    
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(30, 20, 200, 250);
//    [button setImage:[UIImage imageNamed:@"12-eye"] forState:UIControlStateNormal];
//    [self addSubview:button];
//    button.titleLabel.text = @"个人中心";
    
    UIButton  * loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(30, 20, 200, 250);
    [loginBtn setImage:[UIImage imageNamed:@"12-eye"] forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor grayColor];
    
  //  NSLog(@"loginBtn.imageView = %@",loginBtn.imageView);
  // loginBtn.imageView.frame = CGRectMake(50, 50, 50, 50);
//   [loginBtn setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,0)];
    [loginBtn setTitle:@"个人中心" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:24];
    [loginBtn setTitleEdgeInsets:UIEdgeInsetsMake(30.0, 0, -80, 0.0)];
    //[btnTwo addTarget:self action:@selector(goToOne) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setupButton];
    
    UIButton * settingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    settingBtn.frame = CGRectMake(20, height - 50, 80, 40);
    [settingBtn setImage:[UIImage imageNamed:@"01-refresh"] forState:UIControlStateNormal];
    [settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    settingBtn.backgroundColor = [UIColor whiteColor];
    [settingBtn addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:settingBtn];

}
- (void)setupButton
{
     CGFloat height = self.bounds.size.height;
    NSArray * itemIncoNameArr = @[@"01-refresh",@"02-redo",@"03-loopback",@"04-squiggle",@"05-shuffle",@"06-magnifying-glass",@"13-target",@"11-clock",@"10-medical"];
    NSArray * itemNameArr = @[@"跟帖",@"收藏",@"扫一扫",@"离线",@"夜间",@"天气",@"探索",@"阅读日历",@"更多"];
     int z = 0;
    for (int i = 0 ; i < 3; i++) {
        for (int j = 0 ; j < 3; j++) {            
            UIButton * itemBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            itemBtn.frame = CGRectMake(20 + 80 * j, height/2 + 80 * i,60, 60);
            [itemBtn setImage:[UIImage imageNamed:itemIncoNameArr[z]] forState:UIControlStateNormal];
            [itemBtn setTitle:itemNameArr[z] forState:UIControlStateNormal];
            itemBtn.backgroundColor = [UIColor whiteColor];
            [itemBtn addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:itemBtn];
            z++;
        }
    }


}
- (void)didClickButtonAction:(UIButton *)button
{
    
NSLog(@"button.titleLabel.text %@",button.titleLabel.text);
    if ([self.delegate respondsToSelector:@selector(userViewDidClickButtonAction:)]) {
        [self.delegate userViewDidClickButtonAction:button];
    }


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
