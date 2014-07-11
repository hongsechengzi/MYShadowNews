//
//  SNCategoryView.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SNCategoryViewDelegate <NSObject>

- (void)categoryViewDidClickButtonAction:(UIButton *)button;

@end

@interface SNCategoryView : UIView

@property(nonatomic,assign)id<SNCategoryViewDelegate> delegate;
@property(nonatomic,retain)NSDictionary * categoryDic;
@end
