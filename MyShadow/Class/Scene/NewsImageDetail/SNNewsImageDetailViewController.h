//
//  SNNewsImageDetailViewController.h
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNNewsImageDetailView.h"


@interface SNNewsImageDetailViewController : UIViewController<SNNewsImageDetailViewDelegate,SNNewsImageDetailViewDataSource>

@property (copy, nonatomic) NSString * photosetID;
@property (retain, nonatomic)SNNewsImageDetailView * imageDetailView;


- (instancetype) initWithPhotosetID: (NSString *) photosetID;

@end
