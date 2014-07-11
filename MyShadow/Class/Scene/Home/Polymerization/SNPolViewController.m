//
//  SNPolViewController.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-1.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNPolViewController.h"
//#import "SNPolCell.h"
#import "SNPolCollectionCell.h"
#import "SNPolPageModel.h"
#import "SNCollectionHeadView.h"
#import "SNPolNewsModel.h"
//#import "SNRefreshHeaderView.h"
#import "MJRefreshHeaderView.h"


@interface SNPolViewController ()
@property(nonatomic,retain)NSDictionary * mainDic;
//@property(nonatomic,retain)UICollectionView * collectionView;
@property(nonatomic,retain)MJRefreshHeaderView * headerRefreshView;
@end

@implementation SNPolViewController
- (void)dealloc
{
    self.collectionView = nil;
    self.mainDic = nil;
   // [_headerRefreshView free];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init] ;
    //行间距,根据滚动方向确定行
//    flowLayout.minimumLineSpacing = 2;
//    //列间距,最小间距,不能小于放俩个视图的最大间距,
//    flowLayout.minimumInteritemSpacing = 2;
   // flowLayout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[[UICollectionView alloc] initWithFrame:CGRectMake(0, 94, SCREENWIDTH, SCREENHEIGHT) collectionViewLayout:flowLayout] autorelease];
    [flowLayout release];
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor yellowColor];
   [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[SNPolCollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    [self.collectionView registerClass:[SNCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [self setupHeaderRefreshview];
  
}
- (void)setupHeaderRefreshview
{
    self.headerRefreshView = [MJRefreshHeaderView header];
    self.headerRefreshView.scrollView = self.collectionView;
    self.headerRefreshView.beginRefreshingBlock = ^(MJRefreshBaseView * refreshView){
        
        [SNPolPageModel polPageSuccess:^(NSDictionary *polDic) {
            
            self.mainDic = polDic;
            // NSLog(@"polDic= %@",self.mainDic);
            self.collectionView.delegate = self;
            self.collectionView.dataSource = self;
            [self.headerRefreshView endRefreshing];
            [self.collectionView reloadData];
        } fail:^(NSError *error) {
            NSLog(@"error= %@",error);
        }];
        //[self.collectionView reloadData];
    };
}
#pragma mark ---- 设置collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 5;
}
//row每一个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SNPolNewsModel * news = [self randomGettingNewsArrayAtIndexPath:indexPath];
    static NSString * identifier = @"CollectionCell";
    SNPolCollectionCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.news = news;;
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return CGSizeMake(320, 60);
    }else{
      return CGSizeMake(100, 100);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",[NSString stringWithFormat:@"{%ld,%ld}",indexPath.section,indexPath.row]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark----header
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
  
   NSArray * headerArr = [self.mainDic allKeys];
    SNCollectionHeadView * heard = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    heard.oneLabel.text = headerArr[indexPath.section];
    return heard;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(320, 30);
}

#pragma mark------处理数据
- (void)setupData
{
     self.mainDic = [NSDictionary dictionary];
    [SNPolPageModel polPageSuccess:^(NSDictionary *polDic) {
        
        self.mainDic = polDic;
       // NSLog(@"polDic= %@",self.mainDic);
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self.collectionView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"error= %@",error);
    }];
}

- (SNPolNewsModel *)randomGettingNewsArrayAtIndexPath:(NSIndexPath *)indexPath
{
    SNPolNewsModel * news;
    NSArray * newsHeadArr = [self.mainDic allKeys];
    NSString * newsHeadName = [newsHeadArr objectAtIndex:indexPath.section];
    NSMutableArray * newsArr = [NSMutableArray arrayWithArray:[self.mainDic objectForKey:newsHeadName]];
    news = [newsArr objectAtIndex:indexPath.row];
    return news;
}
#pragma mark-----下拉加载
- (void)requestNewsListNewData
{



}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
