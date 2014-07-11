//
//  SNNewsImageDetailView.h
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNNewsImageDetail;
@class SNNewsImageDetailView;

@protocol SNNewsImageDetailViewDataSource <NSObject>
@required

- (SNNewsImageDetail *) detailInNewsDetailView:(SNNewsImageDetailView *) newsImageDetailView;


@end
@protocol SNNewsImageDetailViewDelegate <NSObject>


@end


@interface SNNewsImageDetailView : UIView<UIScrollViewDelegate>
@property (assign, nonatomic) id<SNNewsImageDetailViewDataSource> dataSource;
@property (assign, nonatomic) id<SNNewsImageDetailViewDelegate> delegate;

- (void)reloadData;
@end
