//
//  BaseLoadViewController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/21.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseLoadViewController.h"

@implementation BaseLoadViewController

- (void)setupRootView {
    [super setupRootView];
    [self tableView];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)showUnLoginViewWithType:(WSUnloginViewType)viewType {
    
    [super showUnLoginViewWithType:viewType];
    if (![WSUserModel isLogin]) {
        self.enableHeaderRefresh = NO;
        self.enableFooterRefresh = NO;
    }
}

#pragma mark - event

- (void)setEnableFooterRefresh:(BOOL)enableFooterRefresh {
    
    _enableFooterRefresh = enableFooterRefresh;
    if (enableFooterRefresh) {
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }else {
        self.tableView.mj_footer = nil;
    }
}

- (void)setEnableHeaderRefresh:(BOOL)enableHeaderRefresh {
    
    _enableHeaderRefresh = enableHeaderRefresh;
    if (self.enableFooterRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    }else {
        self.tableView.mj_header = nil;
    }
}

- (void)refreshData {
    if(!self.enableHeaderRefresh) return;
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}

- (void)loadMoreData {
    if(!self.enableFooterRefresh) return;
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
}

#pragma mark - lazy loading

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor baseBackGroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.frame = self.view.bounds;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

@end
