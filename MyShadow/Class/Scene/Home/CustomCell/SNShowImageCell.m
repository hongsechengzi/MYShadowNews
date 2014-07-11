//
//  SNShowImageCell.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNShowImageCell.h"
#import "SNNomarlNewsModel.h"
@interface SNShowImageCell ()

@property(nonatomic,retain)UIImageView * firstIV;
@property(nonatomic,retain)UIImageView * secondIV;
@property(nonatomic,retain)UIImageView * thirdIV;
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UILabel * replyCountLabel;

@end

@implementation SNShowImageCell
- (void)dealloc
{
    RELEASE_SAFELY(_firstIV);
    RELEASE_SAFELY(_secondIV);
    RELEASE_SAFELY(_thirdIV);
    RELEASE_SAFELY(_titleLabel);
    RELEASE_SAFELY(_replyCountLabel);
    RELEASE_SAFELY(_news);
    [super dealloc];

}
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
    CGFloat width = SNNewsNormalCellWidth;
    CGFloat height = SNNewsNormalCellHeight;
     CGFloat titleHeight = SNNewsImageCellTitleHeigth;
    self.firstIV = [[[UIImageView alloc] initWithFrame:CGRectMake(0, titleHeight, (width-10)/3, height-15)] autorelease];
    self.firstIV.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.firstIV];
    self.secondIV = [[[UIImageView alloc] initWithFrame:CGRectMake((width-10)/3+5, titleHeight, (width-10)/3, height-15)] autorelease];
    self.secondIV.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.secondIV];
    self.thirdIV = [[[[UIImageView alloc] initWithFrame:CGRectMake(2*(width-10)/3+10, titleHeight, (width-10)/3, height-15)] autorelease] autorelease];
    self.thirdIV.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.thirdIV];
    
    self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0,3*width/4, titleHeight)] autorelease];
   // self.titleLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.replyCountLabel = [[[UILabel alloc] initWithFrame:CGRectMake(3*width/4, 0,width/4, titleHeight)] autorelease];
    self.replyCountLabel.font = [UIFont systemFontOfSize:10];
   // self.replyCountLabel.backgroundColor = [UIColor blueColor];
    self.replyCountLabel.textAlignment = NSTextAlignmentRight ;
    [self.contentView addSubview:self.replyCountLabel];
    
    

}


- (void)setNews:(SNNomarlNewsModel *)news
{
    if (_news != news) {
        [_news release];
        _news = [news retain];
    }
    
    CGFloat width = SNNewsNormalCellWidth-10;
    CGFloat height = SNNewsImageCellHeight;
    CGFloat titleHeight = SNNewsImageCellTitleHeigth;
    UIImage * placeholderImage = [UIImage imageNamed:SNNewsCellPlaceholderImage];
    [self.firstIV setImageWithURL:[NSURL URLWithString:news.imgSrc] placeholderImage:placeholderImage];
    
    
    NSDictionary * secondImgsrcDic = news.imgExtraArray[0];
    NSString * secondImgsrc = [secondImgsrcDic objectForKey:@"imgsrc"];
    
    [self.secondIV setImageWithURL:[NSURL URLWithString:secondImgsrc] placeholderImage:placeholderImage];
    
    
    
    NSDictionary * thirdImgsrcDic = news.imgExtraArray[1];
    NSString * thirdImgsrc = [thirdImgsrcDic objectForKey:@"imgsrc"];
    
    [self.thirdIV setImageWithURL:[NSURL URLWithString:thirdImgsrc] placeholderImage:placeholderImage];
    
    
    
    self.titleLabel.text = news.title;
    if (news.replyCount > 10000) {
        self.replyCountLabel.text = [NSString stringWithFormat:@"%.1f万跟帖",news.replyCount/10000.0];
    }else{
        self.replyCountLabel.text = [NSString stringWithFormat:@"%ld跟帖",news.replyCount];
    }
    
    self.titleLabel.text = news.title;
    
    
    self.firstIV.frame = CGRectMake(0,titleHeight, (width-10)/3, height-15);
    self.secondIV.frame = CGRectMake((width-10)/3+5, titleHeight, (width-10)/3, height-15);
    self.thirdIV.frame = CGRectMake(2*(width-10)/3+10, titleHeight, (width-10)/3, height-15);
    self.titleLabel.frame =CGRectMake(0, 0,4*width/5, titleHeight);
    self.replyCountLabel.frame = CGRectMake(4*width/5, 0,width/5, titleHeight);
    //self.replyCountLabel.backgroundColor = [UIColor redColor];

    
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
