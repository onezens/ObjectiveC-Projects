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
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if (self.tableView.contentInset.top > kNavBarHeight+kStatusBarHeight) {
        self.tableView.contentInset = UIEdgeInsetsMake(kNavBarHeight+kStatusBarHeight, 0, kTabBarHeight, 0);
    }
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
    }else {
        self.enableHeaderRefresh = true;
    }
}

#pragma mark - event


- (void)setEnableHeaderRefresh:(BOOL)enableHeaderRefresh {
    
    if (_enableHeaderRefresh == enableHeaderRefresh) return;
    _enableHeaderRefresh = enableHeaderRefresh;
    if (self.enableHeaderRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];

    }else {
        self.tableView.mj_header = nil;
    }
}

- (void)refreshData {
    if(!self.enableHeaderRefresh) return;
 
}

- (void)loadMoreData {
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
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        self.tableView.mj_footer.automaticallyHidden = YES;

    }
    return _tableView;
}

@end
