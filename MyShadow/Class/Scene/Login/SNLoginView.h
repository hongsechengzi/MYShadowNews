//
//  SNLoginView.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-30.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SNLoginViewDelegate <NSObject>


- (void)loginViewDidClickButtonAction:(UIButton *)button;

@end


@interface SNLoginView : UIView

@property(nonatomic,retain)UITextField * userNameTF;
@property(nonatomic,retain)UITextField * passwordTF;
@property(nonatomic,assign)id<SNLoginViewDelegate> delegate;

@end
