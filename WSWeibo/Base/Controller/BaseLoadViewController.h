//
//  BaseLoadViewController.h
//  WSWeibo
//
//  Created by wackosix on 16/6/21.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseLoadViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

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
