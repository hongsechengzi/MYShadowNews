//
//  SNNewsCell.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class SNLocalNewsModel;

@class SNHeaderNewsModel;
@class SNNomarlNewsModel;
@interface SNNormalNewsCell : UITableViewCell

//@property(nonatomic,retain)SNLocalNewsModel * news;
//@property(nonatomic,retain)SNHeaderNewsModel * news;

@property(nonatomic,retain)SNNomarlNewsModel * news;

@end
