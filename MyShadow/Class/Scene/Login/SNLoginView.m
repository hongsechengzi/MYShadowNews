//
//  SNLoginView.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNLoginView.h"

@implementation SNLoginView
- (void)dealloc
{
    RELEASE_SAFELY(_passwordTF);
    RELEASE_SAFELY(_userNameTF);
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews
{
    self.backgroundColor = [UIColor yellowColor];
    [self setupUserNameTF];
    [self setupPasswordTF];
    [self setupLoginButton];
    [self setupOtherLoginButton];
    [self setupRegistButton];
    
    
    
    
    
    
    

}
- (void)setupRegistButton
{
    UIButton * regintBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    regintBtn.frame = CGRectMake(0, SCREENHEIGHT - 64- 40, SCREENWIDTH, 30);
    [regintBtn setTitle:@"没有账号?手机号快速注册" forState:UIControlStateNormal];
    [regintBtn addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:regintBtn];
    
}

- (void)setupOtherLoginButton
{
    UILabel * showLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, SCREENHEIGHT/3, 140, 10)];
    showLabel.text = @"还可以选择以下方式登录";
    showLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:showLabel];
    [showLabel release];
   
        UIButton * sinaButton = [UIButton buttonWithType:UIButtonTypeSystem];
        sinaButton.frame = CGRectMake(2, SCREENHEIGHT/3 + 10, (SCREENWIDTH-6)/2, 30);
    sinaButton.backgroundColor = [UIColor redColor];
        [sinaButton setTitle:@"新浪微博登录" forState:UIControlStateNormal];
    [sinaButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sinaButton];
    
    UIButton * qqButton = [UIButton buttonWithType:UIButtonTypeSystem];
    qqButton.backgroundColor = [UIColor blueColor];
    qqButton.frame = CGRectMake((SCREENWIDTH-6)/2 + 4, SCREENHEIGHT/3 + 10, (SCREENWIDTH-6)/2, 30);
     [qqButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [qqButton setTitle:@"QQ账号登录" forState:UIControlStateNormal];
    [self addSubview:qqButton];

}
- (void)setupLoginButton
{
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.backgroundColor = [UIColor whiteColor];
    loginBtn.frame = CGRectMake(0, 100, SCREENWIDTH, 30);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loginBtn];


}

- (void)setupUserNameTF
{
    self.userNameTF = [[[UITextField alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 30)] autorelease];
    self.userNameTF.borderStyle = UITextBorderStyleNone;
    // self.userNameTF.backgroundColor = [UIColor redColor];
    self.userNameTF.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.userNameTF];
    self.userNameTF.placeholder = @"邮箱账号或手机号";
    UIImageView * leftImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,30,30)] autorelease];
    leftImageView.image = [UIImage imageNamed:@"02-redo"];
    self.userNameTF.leftView = leftImageView;
    self.userNameTF.leftViewMode =  UITextFieldViewModeAlways;
}
- (void)setupPasswordTF
{
    self.passwordTF = [[[UITextField alloc] initWithFrame:CGRectMake(0, 50, SCREENWIDTH, 30)] autorelease];
    self.passwordTF.borderStyle = UITextBorderStyleNone;
    // self.userNameTF.backgroundColor = [UIColor redColor];
    self.passwordTF.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.passwordTF];
    self.passwordTF.placeholder = @"密码";
    self.passwordTF.secureTextEntry = YES;
    UIImageView * pLeftImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,30,30)] autorelease];
    pLeftImageView.image = [UIImage imageNamed:@"05-shuffle"];
    self.passwordTF.leftView = pLeftImageView;
    self.passwordTF.leftViewMode =  UITextFieldViewModeAlways;
    UIButton * pRightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pRightBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    pRightBtn.frame = CGRectMake(0, 0, 90, 30);
    self.passwordTF.rightView = pRightBtn;
    self.passwordTF.rightViewMode = UITextFieldViewModeAlways;
    [pRightBtn addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickButtonAction:(UIButton *)button
{
 NSLog(@"button.titleLabel.text %@",button.titleLabel.text);
    if ([self.delegate respondsToSelector:@selector(loginViewDidClickButtonAction:)]) {
        [self.delegate loginViewDidClickButtonAction:button];
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
