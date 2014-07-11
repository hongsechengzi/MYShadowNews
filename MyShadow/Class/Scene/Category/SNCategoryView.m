//
//  SNCategoryView.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNCategoryView.h"
#import "SNCategoryModel.h"

@implementation SNCategoryView
- (void)dealloc
{
    self.categoryDic = nil;
    self.delegate = nil;
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setCategoryDic:(NSDictionary *)categoryDic
{
    if (_categoryDic != categoryDic) {
        [_categoryDic release];
        _categoryDic = [categoryDic retain];
    }
    self.backgroundColor = [UIColor grayColor];
    NSArray * titleArray = [categoryDic allKeys];
    
    int i = 0;
    for (NSString * titleName  in titleArray) {
        
        SNCategoryModel * category = [categoryDic objectForKey:titleName];
    
        //图标
        UIImageView * iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 80 + 60*i, 30, 30)];
        UIImage * iconImage = [UIImage imageNamed:category.imageName];
        iconImageView.image = iconImage;
        [self addSubview:iconImageView];
        [iconImageView release];
        
        //按钮
        UIButton * categoryButton = [UIButton buttonWithType:UIButtonTypeSystem];
        categoryButton.frame = CGRectMake(80, 80 + 60*i, 60, 30);
        [categoryButton setTitle:category.title forState:UIControlStateNormal];
        [categoryButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        categoryButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [self addSubview:categoryButton];
        i++;
    }
}


- (void)didClickButtonAction:(UIButton *)button
{
    NSLog(@"button.titleLabel.text %@",button.titleLabel.text);
    if ([self.delegate respondsToSelector:@selector(categoryViewDidClickButtonAction:)]) {
        [self.delegate categoryViewDidClickButtonAction:button];
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
