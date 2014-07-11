//
//  SNPolViewController.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-1.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNPolViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,retain)UICollectionView * collectionView;
@end
