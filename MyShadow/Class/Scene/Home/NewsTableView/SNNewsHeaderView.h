//
//  SNNewsItemView.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-29.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNNewsHeaderView;
@class SNNewsMenu;

/**
 *  用于约定页眉的行为和行为.
 */
@protocol SNNewsHeaderViewDelegate <NSObject>
@optional
/**
 *  设置某位置页眉单元格的宽度.
 *
 *  @param newsHeaderView   新闻视图页眉对象.
 *  @param index            位置.
 *
 *  @return 此位置页眉单元格的宽度.
 */
- (CGFloat) newsHeaderView: (SNNewsHeaderView *) newsHeaderView
       widthForCellAtIndex: (NSUInteger) index;

/**
 *  设置新闻视图页眉的高度.默认42.0.
 *
 *  @param newsView 轮转视图.
 *
 *  @return 返回页眉高度.
 */
- (NSNumber *) heightForNewsView: (SNNewsHeaderView *) newsHeaderView;

/**
 *  点击页眉某个按钮的响应事件.
 *
 *  @param newsHeaderView 新闻视图页眉对象.
 *  @param index          位置.
 */
- (void) newsHeaderView: (SNNewsHeaderView *) newsHeaderView
didClickSegmentActionAtIndex: (NSUInteger) index;

@end

/**
 * 用于约定为页眉提供数据.
 */
@protocol SNNewsHeaderViewDataSource <NSObject>

@required

/**
 *  获取新闻菜单.
 *
 *  @param newsHeaderView 新闻视图页眉对象.
 *
 *  @return 新闻菜单对象.
 */
- (SNNewsMenu *) menuInNewsHeaderView: (SNNewsHeaderView *) newsHeaderView;

@end

@interface SNNewsHeaderView : UIView<UIScrollViewDelegate>
@property (assign, nonatomic) id<SNNewsHeaderViewDelegate> delegate;//!< 布局代理.
@property (assign, nonatomic) id<SNNewsHeaderViewDataSource> dataSource; //!< 数据源代理.
@property (assign, nonatomic) NSUInteger selectedIndex; //!< 被选中的位置.

@end
