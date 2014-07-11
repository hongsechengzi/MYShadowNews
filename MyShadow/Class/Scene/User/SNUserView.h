//
//  SNUserView.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SNUserViewDelegate <NSObject>

- (void)userViewDidClickButtonAction:(UIButton *)button;

@end

@interface SNUserView : UIView
@property(nonatomic,assign)id<SNUserViewDelegate> delegate;
@end
