//
//  SNNewsViewController.m
//  ShadowNews
//
//  Created by lanou3g on 14-6-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNewsViewController.h"

#import "SNHeaderView.h"
#import "SNNewsHeaderView.h"

#import "SNLocalPageModel.h"
#import "SNLocalNewsModel.h"
#import "SNHeaderPageModel.h"

#import "SNMainMenu.h"

#import "SNNomarlNewsModel.h"
#import "SNNomarlNewsPageModel.h"
#import "SNNomarlNewsTV.h"


#import "SNLocalNewsTV.h"
#import "SNHeaderNewsTV.h"

#import "SNCategoryViewController.h"
#import "SNUserViewController.h"
#import "SNNewsTableView.h"
#import "SNPolViewController.h"
#import "SNNewsMenu.h"
#import "SNMainMenuModel.h"

#import "YRSideViewController.h"
#import "SNAppDelegate.h"

@interface SNNewsViewController ()

@property(nonatomic,retain)NSMutableArray * SNNVDelegates;//!< 当前各个视图的代理.
@property (retain, nonatomic) NSMutableDictionary * SNNVLoadedViews; //!< 存储已加载的视图.以新闻版块名为键,以视图为值.

//@property(nonatomic,assign)NSInteger currentIndex;//!<当前头条新闻图像下标
@property(nonatomic,retain)SNNewsTableView * tableView;//!表视图
@property(nonatomic,retain)NSMutableArray * newsMenuArray;//!<菜单数组




@end

@implementation SNNewsViewController
- (void)dealloc
{
   // RELEASE_SAFELY(_headerView);
    RELEASE_SAFELY(_newsItemScroll);
    RELEASE_SAFELY(_newsArray);
    RELEASE_SAFELY(_tableView);
//    self.nomarlNewsTV = nil;
    self.newsMenuArray = nil;
//    self.simpleNewsTV = nil;
    
    
    self.SNNVDelegates = nil;
#if ! __has_feature(objc_arc)
    [super dealloc];
#endif

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.SNNVDelegates = [NSMutableArray arrayWithCapacity:42];
        self.SNNVLoadedViews = [NSMutableDictionary dictionaryWithCapacity:42];
        
        // 不让控制器自动调整UIScrollview位置.
        self.automaticallyAdjustsScrollViewInsets = NO;
    
    }
    return self;
}
- (void)loadView
{
    SNNewsView * newsView = [[SNNewsView alloc] init];
    newsView.delegate = self;
    newsView.dataSource = self;
    self.view = newsView;
    SNRelease(newsView);
}
- (void)viewDidLoad
{
    // NSLog(@"%@",self.tableView);
    [super viewDidLoad];
     self.title = @"ShadowNews";
//    [self setupNormalSubviews];
//   // [self.headerNewsTV handleHeaderPageData];
    [self setupItemButton];

    
   NSArray * newsArr = [self.newsMenuDic allKeys];
    self.newsMenuArray = [NSMutableArray arrayWithArray:newsArr];
//    [self.newsMenuArray insertObject:@"头条" atIndex:0];
    
//    UISegmentedControl * segment = [[UISegmentedControl alloc] initWithItems:self.newsMenuArray];
//    segment.frame = CGRectMake(0, 0,self.newsMenuArray.count * 60, SNNewsViewMenuHeight);
//    [self.newsItemScroll addSubview:segment];
//    self.newsItemScroll.contentSize = CGSizeMake(self.newsMenuArray.count * 60, SNNewsViewMenuHeight);
//    [segment addTarget:self action:@selector(didClickSegmentControlAction:) forControlEvents:UIControlEventValueChanged];
}
#pragma mark -------------合代码
-(UIView *)newsView:(SNNewsView *)newsView viewForTitle:(NSString *)title preLoad:(BOOL)preLoad
{
    NSLog(@"title = %@",title);
    
    SNNewsTableView * newsTableView = [self SNNVCLoadedViewForTitle: title];
    //newsTableView.headerView.scrollView.delegate = self;
    
    
    if (nil == newsTableView) {
        newsTableView = [SNNewsTableView tableViewPageWithTitle:title preLoad:preLoad];
        [self SNNVCAddLoadedView:newsTableView forTitle:title];
    }
    if (YES != preLoad) {
        self.tableView = newsTableView;
    }
    
    newsTableView.preLoad = preLoad;
    
    NSDictionary * menuDic = [SNMainMenuModel mianMenuDic];
    
    SNMainMenu * oneNewsMenu = [menuDic objectForKey:title];
    
    if ([newsTableView.title isEqualToString:SNMainMenuHeaderPageKey]) {
        
        SNHeaderNewsTV * headerNewsTV = [[[SNHeaderNewsTV alloc] initWithTableView:newsTableView] autorelease];
        [headerNewsTV handleHeaderPageData];
    }
    if ([oneNewsMenu.pageKey isEqualToString:SNMainMenuNormalPageKey] ||[oneNewsMenu.pageKey isEqualToString:SNMainMenuSimplePageKey]) {
        SNNomarlNewsTV * nomarlNewsTV = [[SNNomarlNewsTV alloc] initWithTableView:newsTableView];
        [nomarlNewsTV handlePageDataWithMainMenu:oneNewsMenu];
    }
//    if ([oneNewsMenu.pageKey isEqualToString:SNMainMenuSimplePageKey]) {
//        SNSimpleNewsTV * simpleNewsTV = [[SNSimpleNewsTV alloc] initWithTableView:newsTableView];
//        [simpleNewsTV
//         handlePageDataWithMainMenu:oneNewsMenu];
//        
//    }
    if ([oneNewsMenu.pageKey isEqualToString:SNMainMenuLocalPageKey]) {
        SNLocalNewsTV * localNewsTV = [[SNLocalNewsTV alloc] initWithTableView:newsTableView];
        [localNewsTV handlePageDataWithMainMenu:oneNewsMenu];
    }
    if ([oneNewsMenu.pageKey isEqualToString:SNMainMenuPolymerizationPageKey]) {
        
        SNPolViewController * polVC = [[SNPolViewController alloc] init];
        polVC.view.frame =CGRectMake(5, SNNewsViewMenuHeight, SCREENWIDTH-10, SCREENHEIGHT);
        //[self addSubview:polVC.collectionView];
    }
    

    
    return newsTableView;

}
- (SNNewsMenu *) menuInNewsView: (SNNewsView *) newsView
{

    SNNewsMenu * menu = [SNNewsMenu menu];
    
    return menu;

}

/**
 *  获取某个分区的预加载视图.
 *
 *  @param title 新闻版块名.
 *
 *  @return 新闻版块的预加载视图.
 */
- (SNNewsTableView *)SNNVCLoadedViewForTitle: (NSString *) title
{
    return [self.SNNVLoadedViews objectForKey: title];
}
/**
 *  为某个新闻版块添加视图.
 *
 *  @param view  新闻版块视图.
 *  @param title 新闻版块名.
 */
- (void)SNNVCAddLoadedView: (UIView *) view forTitle: (NSString *) title
{
    [self.SNNVLoadedViews setObject: view forKey: title];
    
    //!!!:暂时先不进行回收.算法有点复杂,需要考虑往返.
    // ???:建议只考虑
    // !!!:建议只存储 预加载视图.
    // !!!:建议,让视图自己去管理 "预加载" 到 "加载"的转换.
    // !!!:建议,让视图自己去管理delegate和dataSource的retain和release.
}



//- (void)addDelegateForCell: (SNNewsTableView *) tableView
//{
//    SNNewsDelegate * delegate = [SNNewsDelegate delegateWithCell:tableView];
//    [self.SNNVDelegates addObject:delegate];
//
//}



#pragma mark ---布局BarItem按钮
- (void)setupItemButton
{
    
   UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
   backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:SNHeaderLeftBarItemImage] style:UIBarButtonItemStylePlain target:self action:@selector(didClickLeftBarItemAction:)];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    [leftButtonItem release];
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:SNHeaderLeftBarItemImage] style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightBarItemAction:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    [rightButtonItem release];
}
- (void)didClickLeftBarItemAction:(UIBarButtonItem *)buttonItem
{
    SNAppDelegate *delegate=(SNAppDelegate*)[[UIApplication sharedApplication]delegate];
    YRSideViewController * sideViewController=[delegate sideViewController];
    [sideViewController showLeftViewController:true];
   
}
- (void)didClickRightBarItemAction:(UIBarButtonItem *)buttonItem
{
    SNAppDelegate * delegate=(SNAppDelegate *)[[UIApplication sharedApplication]delegate];
    YRSideViewController * sideViewController=[delegate sideViewController];
    [sideViewController showRightViewController:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
