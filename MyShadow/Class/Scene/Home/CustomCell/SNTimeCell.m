//
//  SNTimeCell.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNTimeCell.h"
#import "SNHomeConst.h"
//#import "SNSimpleNewsModel.h"

#import "SNNomarlNewsModel.h"

@interface SNTimeCell ()

@property(nonatomic,retain)UIImageView * newsImage;
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UILabel * timeLabel;
@property(nonatomic,retain)UILabel * replyCountLabel;

@end


@implementation SNTimeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    CGFloat height = SNNewsNormalCellHeight;
    //NSLog(@"+++++++++%f",height);
    CGFloat width = SNNewsNormalCellWidth;
    // NSLog(@"+++++++++%f",width);
    self.newsImage = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width/4, height)] autorelease];
   // self.newsImage.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_newsImage];
    
    self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(width/4 +5, 0, width-width/4-15, 2*height/3)] autorelease];
//  self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
    
    self.timeLabel = [[[UILabel alloc] initWithFrame:CGRectMake(width/4+5, 2*height/3, width-width/4-15, height/3)] autorelease];
   // self.timeLabel.backgroundColor = [UIColor greenColor];
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    self.timeLabel.numberOfLines = 0;
    
    [self.contentView addSubview:self.timeLabel];
    
    self.replyCountLabel = [[[UILabel alloc] initWithFrame:CGRectMake(width-width/4-15-60,height/3-10, 60, 10)] autorelease];
   // self.replyCountLabel.backgroundColor = [UIColor yellowColor];
    self.replyCountLabel.textAlignment = NSTextAlignmentRight;
    self.replyCountLabel.font = [UIFont systemFontOfSize:10];
    [self.timeLabel addSubview:self.replyCountLabel];
    
}

- (void)setNews:(SNNomarlNewsModel *)news
{
    if (_news != news) {
        [_news release];
        _news = [news retain];
    }
    
    CGFloat height = SNNewsNormalCellHeight;
    // NSLog(@"---------%f",height);
    CGFloat width = SNNewsNormalCellWidth;
    //  NSLog(@"---------%f",width);
    if (_news != news) {
        [_news release];
        _news = [news retain];
    }
    
    self.titleLabel.text = news.title;
    self.titleLabel.frame = CGRectMake(width/4 +5, 5, width-width/4-15, 2*height/3);
    
    NSDateFormatter * publishFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [publishFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//HH:24小时制
    NSString * publishStr = news.publishTime;
    NSDate * publishDate = [publishFormatter dateFromString:publishStr];
    NSTimeInterval time = [publishDate timeIntervalSinceNow];
  
    if ( -time < 3600) {
        int minute = -time/60;
        self.timeLabel.text = [NSString stringWithFormat:@"%d分钟前",minute];
        
    }else if(-time < 3600*24 && -time >3600){
        int hour = -time/3600;
        self.timeLabel.text = [NSString stringWithFormat:@"%d小时前",hour];

       
    }else{
    NSArray * timeArray = [news.publishTime componentsSeparatedByString:@" "];
    self.timeLabel.text = timeArray[0];
    }
    self.timeLabel.frame = CGRectMake(width/4+5, 2*height/3+5, width-width/4-15, height/3);
    if (news.replyCount > 10000) {
        self.replyCountLabel.text = [NSString stringWithFormat:@"%.1f万跟帖",news.replyCount/10000.0];
    }else{
        self.replyCountLabel.text = [NSString stringWithFormat:@"%ld跟帖",news.replyCount];
    }
   
    self.replyCountLabel.frame = CGRectMake(width-width/4-15-60,height/3-10, 60, 10);
    
    NSURL * url = [NSURL URLWithString:news.imgSrc];
    self.newsImage.frame = CGRectMake(0, 5, width/4, height);
    [self.newsImage setImageWithURL:url placeholderImage:[UIImage imageNamed:SNNewsCellPlaceholderImage]];
    

}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
