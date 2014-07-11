//
//  SNNewsCell.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNormalNewsCell.h"
#import "SNLocalNewsModel.h"
#import "SNNomarlNewsModel.h"

@interface SNNormalNewsCell ()

@property(nonatomic,retain)UIImageView * newsImage;
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UILabel * detailLabel;
@property(nonatomic,retain)UILabel * replyCountLabel;

@end

@implementation SNNormalNewsCell
- (void)dealloc
{
    RELEASE_SAFELY(_news);
    RELEASE_SAFELY(_titleLabel);
    RELEASE_SAFELY(_detailLabel);
    RELEASE_SAFELY(_newsImage);
    RELEASE_SAFELY(_replyCountLabel);
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       [self setupSubview];
    }
    return self;
}
- (void)setupSubview
{
    CGFloat height = SNNewsNormalCellHeight;
    //NSLog(@"+++++++++%f",height);
    CGFloat width = SNNewsNormalCellWidth;
    // NSLog(@"+++++++++%f",width);
    self.newsImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width/4, height)] autorelease];
    self.newsImage.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_newsImage];
    
    self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(width/4 +5, 0, width-width/4-15, height/3)] autorelease];
  //  self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.titleLabel];
    
    self.detailLabel = [[[UILabel alloc] initWithFrame:CGRectMake(width/4+5, height/3, width-width/4-15, 2 *height/3)] autorelease];
    //self.detailLabel.backgroundColor = [UIColor greenColor];
    self.detailLabel.font = [UIFont systemFontOfSize:10];
    self.detailLabel.numberOfLines = 0;

    [self.contentView addSubview:self.detailLabel];
    
    self.replyCountLabel = [[[UILabel alloc] initWithFrame:CGRectMake(width-width/4-15-60 ,2 *height/3-10, 60, 10)] autorelease];
   // self.replyCountLabel.backgroundColor = [UIColor yellowColor];
    self.replyCountLabel.textAlignment = NSTextAlignmentRight;
    self.replyCountLabel.font = [UIFont systemFontOfSize:10];
    [self.detailLabel addSubview:self.replyCountLabel];
    
}

//- (void)setNews:(SNLocalNewsModel *)news
//{
//    if (_news != news) {
//        [_news release];
//        _news = [news retain];
//    }
//    self.titleLabel.text = news.title;
//    self.detailLabel.text = news.title;
//    NSURL * url = [NSURL URLWithString:news.imgSrc];
//    [self.newsImage setImageWithURL:url];
//}

- (void)setNews:(SNNomarlNewsModel *)news
{
    CGFloat height = SNNewsNormalCellHeight;
    CGFloat width = SNNewsNormalCellWidth;
    if (_news != news) {
        [_news release];
        _news = [news retain];
    }
    self.titleLabel.text = news.title;
    self.titleLabel.frame = CGRectMake(width/4 +5, 0, width-width/4-15, height/3);
    
    self.detailLabel.text = news.digest;
    self.detailLabel.frame = CGRectMake(width/4+5, height/3, width-width/4-15, 2 *height/3);
    if (news.replyCount > 10000) {
    self.replyCountLabel.text = [NSString stringWithFormat:@"%.1f万跟帖",news.replyCount/10000.0];
    }else{
    self.replyCountLabel.text = [NSString stringWithFormat:@"%ld跟帖",news.replyCount];
    }
//    if (nil != news.tag) {
//        UIImageView * tagIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:news.tag]];
//        
//        tagIV.backgroundColor = [UIColor redColor];
//        tagIV.frame = CGRectMake(width-width/4-15-60+30,2 *height/3-10, 30, 10);
//        
//        self.replyCountLabel.frame = CGRectMake(width-width/4-15-60-30 ,2 *height/3-10, 60, 10);
//        [self.detailLabel addSubview:tagIV];
//    }else{
//        
//    self.replyCountLabel.frame = CGRectMake(width-width/4-15-60 ,2 *height/3-10, 60, 10);
//    }
    self.replyCountLabel.frame = CGRectMake(width-width/4-15-60 ,2 *height/3-10, 60, 10);
    NSURL * url = [NSURL URLWithString:news.imgSrc];
    self.newsImage.frame = CGRectMake(0, 0, width/4, height);
    [self.newsImage setImageWithURL:url placeholderImage:[UIImage imageNamed:SNNewsCellPlaceholderImage]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
