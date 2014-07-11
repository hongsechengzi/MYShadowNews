//
//  SNNewsImageDetailView.m
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNewsImageDetailView.h"
#import "SNNewsImageDetail.h"

#import "SNHeaderView.h"

@interface SNNewsImageDetailView ()

@property (retain, nonatomic) SNNewsImageDetail * SNImageDetail;
@property (retain, nonatomic) UIScrollView * scrollView;
@property (retain, nonatomic) UILabel * titleLabel;


@end
@implementation SNNewsImageDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}
- (void)reloadData
{
    self.SNImageDetail = [self.dataSource detailInNewsDetailView:self];
    
    NSLog(@"self.SNImageDetail.photos = %@",self.SNImageDetail);
    
    
    
    
}

- (SNNewsImageDetail *)SNImageDetail
{
    if (nil == _SNImageDetail) {
        
        self.SNImageDetail = [self.dataSource detailInNewsDetailView:self];
        
    }
    return _SNImageDetail;
}

- (void)layoutSubviews
{
//    CGSize  contentSize = self.scrollView.contentSize;
//    CGRect bouds = self.scrollView.bounds;
//    CGRect frame = self.scrollView.frame;
}

- (void)setupSubviews
{
     CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
     self.scrollView= [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)] autorelease];
     self.scrollView.backgroundColor = [UIColor blackColor];

    
    self.scrollView.pagingEnabled = YES;
    // !!!:禁用回弹
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
   
    [self addSubview:self.scrollView];
    
     self.scrollView.contentSize = CGSizeMake(3*width, height-64);
    
    for (int i = 0; i < 3; i ++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320 *i, 0, width, height-64)];
        imageView.backgroundColor = [UIColor redColor];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 101+i;
        [self.scrollView addSubview:imageView];
        [imageView release];
    }
    self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, height-100, width, 100)] autorelease];
    self.titleLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.titleLabel];
    
//    [self reloadData];
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
