//
//  SNFirstPolCell.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-1.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SNPolNewsModel;
@interface SNPolCollectionCell : UICollectionViewCell
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UILabel * detailLabel;
@property(nonatomic,retain)SNPolNewsModel * news;

@end
