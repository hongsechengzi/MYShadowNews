//
//  SNFirstPolCell.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-1.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNPolCollectionCell.h"
#import "SNPolNewsModel.h"

@implementation SNPolCollectionCell
- (void)dealloc
{
    RELEASE_SAFELY(_titleLabel);
    RELEASE_SAFELY(_detailLabel);
    self.news = nil;
    [super dealloc];

}
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
    self.backgroundColor = [UIColor redColor];
    
  CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
   
    self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 2 * height/3 )] autorelease];
    self.titleLabel.backgroundColor = [UIColor cyanColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.numberOfLines = 0;
    
    [self.contentView addSubview:self.titleLabel];
    self.detailLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 2 * height/3, width, height/3)] autorelease];
    self.detailLabel.font = [UIFont systemFontOfSize:12];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.detailLabel];
}
- (void)setNews:(SNPolNewsModel *)news
{
    if (_news != news) {
        [_news release];
        _news = [news retain];
    }
    self.titleLabel.text = news.title;
    self.detailLabel.text = news.digest;
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    self.titleLabel.frame = CGRectMake(0, 0, width, 2 * height/3 );
    self.detailLabel.frame = CGRectMake(0, 2 * height/3, width, height/3);
    
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
