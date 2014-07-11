//
//  SNFirstNewsCell.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNHeaderView.h"
#import "SNLocalNewsModel.h"
#import "SNNomarlNewsModel.h"


#define HEADERWIDTH 320
#define HEADERHEIGHT 120

@interface SNHeaderView ()
@property(nonatomic,assign)NSInteger currentIndex;//!<当前头条新闻图像下标
//@property(nonatomic,retain)NSArray * firstNewsArray;//!<接收新闻数组
@property(nonatomic,retain)UIScrollView * scrollView;//!<头部滚动视图
@property(nonatomic,retain)NSMutableArray * imageArray;//!<回传头部滚动视图图像数组
@end

@implementation SNHeaderView
- (void)dealloc
{
    RELEASE_SAFELY(_firstNewsArray);
    RELEASE_SAFELY(_scrollView);
    RELEASE_SAFELY(_imageArray);
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview
{
    CGFloat width = self.frame.size.width;
    self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, HEADERWIDTH, HEADERHEIGHT)] autorelease];
    //self.scrollView.backgroundColor = [UIColor cyanColor];
    self.scrollView.contentSize = CGSizeMake(3 * HEADERWIDTH, HEADERHEIGHT);
    self.scrollView.contentOffset = CGPointMake(HEADERWIDTH, 0);
    self.scrollView.pagingEnabled = YES;
    // !!!:禁用回弹
    self.scrollView.bounces = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    
//    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, HEADERHEIGHT, HEADERWIDTH, 20)];
//        [self addSubview:titleLabel];
//    titleLabel.backgroundColor = [UIColor redColor];
//    [titleLabel release];

    
    for (int i = 0; i < 3; i++) {
        UIScrollView * scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(HEADERWIDTH*i, 0, width, HEADERHEIGHT)];
      //  scroll.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:scroll];
        scroll.showsVerticalScrollIndicator = NO;
        scroll.showsHorizontalScrollIndicator = NO;
        [scroll release];
    }
    [self addSubview:self.scrollView];
    self.imageArray = [NSMutableArray array];
}

- (void)setFirstNewsArray:(NSArray *)firstNewsArray
{
    if (_firstNewsArray != firstNewsArray) {
        [_firstNewsArray release];
        _firstNewsArray = [firstNewsArray retain];
    }
    for (int i = 0; i < _firstNewsArray.count; i++) {

        SNNomarlNewsModel * news = [_firstNewsArray objectAtIndex:i];
       // !!!:还要添加标题,后期优化
        UIImageView * newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,HEADERWIDTH, HEADERHEIGHT)];
        newsImageView.userInteractionEnabled = YES;
        
        [newsImageView setImageWithURL:[NSURL URLWithString:news.imgSrc] placeholderImage:[UIImage imageNamed:SNNewsTableHeaderViewPlaceholderImage]];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, HEADERHEIGHT -20, HEADERWIDTH, 20)];
        titleLabel.text = news.title;
        [newsImageView addSubview:titleLabel];
        titleLabel.backgroundColor = [UIColor redColor];
        titleLabel.alpha = 0.7;
        [titleLabel release];

        [_imageArray addObject:newsImageView];
        [newsImageView release];
    }
    if ([_imageArray count] == 1) {
        _scrollView.scrollEnabled = NO;
    }
    UIScrollView * secondScroll = [[_scrollView subviews] objectAtIndex:1];
    [secondScroll addSubview:[_imageArray objectAtIndex:0]];
    
  //  NSLog(@"_scrollView.subviews = %@",_scrollView.subviews);
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    UIScrollView * secondScroll = [scrollView.subviews objectAtIndex:1];
    UIImageView * imageView = [secondScroll.subviews objectAtIndex:0];
    _currentIndex = [self.imageArray indexOfObject:imageView];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    CGPoint  offset = scrollView.contentOffset;
    if (offset.x < SCREENWIDTH) {
        [self scrollViewWillDidScrollRight:scrollView];
    }
    if (offset.x > SCREENWIDTH) {
        [self scrollViewWillDidScrollLeft:scrollView];
    }
}

- (void)scrollViewWillDidScrollRight:(UIScrollView *)scrollView
{
    UIScrollView * firstScroll = [scrollView.subviews objectAtIndex:0];
    if (_currentIndex == 0) {
        
        UIImageView * showImageView = [self.imageArray lastObject];
        if (firstScroll.subviews.count == 0) {
            [firstScroll addSubview:showImageView];
        }else{
            [firstScroll.subviews.firstObject removeFromSuperview];
            [firstScroll addSubview:showImageView];
        }
    }else{
        UIImageView * showImageView = [self.imageArray objectAtIndex:_currentIndex - 1];
        if (firstScroll.subviews.count == 0) {
            [firstScroll addSubview:showImageView];
        }else{
            [firstScroll.subviews.firstObject removeFromSuperview];
            [firstScroll addSubview:showImageView];
        }
    }
}
- (void)scrollViewWillDidScrollLeft:(UIScrollView *)scrollView
{
    UIScrollView * thirdScroll = [scrollView.subviews objectAtIndex:2];
    if (_currentIndex == self.imageArray.count - 1) {
        UIImageView * showImageView = [self.imageArray firstObject];
        if (thirdScroll.subviews.count == 0) {
            [thirdScroll addSubview:showImageView];
        }else{
            [thirdScroll.subviews.firstObject removeFromSuperview];
            [thirdScroll addSubview:showImageView];
        }
    }else{
        UIImageView * showImageView = [self.imageArray objectAtIndex:_currentIndex + 1];
        if (thirdScroll.subviews.count == 0) {
            [thirdScroll addSubview:showImageView];
        }else{
            [thirdScroll.subviews.firstObject removeFromSuperview];
            [thirdScroll addSubview:showImageView];
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint  offset = scrollView.contentOffset;
    UIScrollView * firstScroll = [scrollView.subviews objectAtIndex:0];
    UIScrollView * secondScroll = [scrollView.subviews objectAtIndex:1];
    UIScrollView * thirdScroll = [scrollView.subviews objectAtIndex:2];
    if (offset.x == 0) {
        UIImageView * firstView = firstScroll.subviews.firstObject;
        [secondScroll.subviews.firstObject removeFromSuperview];
        [secondScroll addSubview:firstView];
        
        offset.x = SCREENWIDTH;
        scrollView.contentOffset = offset;
    }
    if (offset.x == 2 * SCREENWIDTH) {
        UIImageView * thirdView = thirdScroll.subviews.firstObject;
        [secondScroll.subviews.firstObject removeFromSuperview];
        [secondScroll addSubview:thirdView];
        offset.x = SCREENWIDTH;
        scrollView.contentOffset = offset;
    }
}

@end
