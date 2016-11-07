//
//  BaseLoadViewController.h
//  WSWeibo
//
//  Created by onezen on 16/6/21.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseLoadViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) BOOL enableHeaderRefresh;

/**
 *  tableview
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *  刷新数据
 */
- (void)refreshData;

/**
 *  加载更多数据
 */
- (void)loadMoreData;

@end
