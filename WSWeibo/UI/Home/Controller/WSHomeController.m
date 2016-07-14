//
//  WSHomeController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/22.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSHomeController.h"
#import "WSOauthController.h"
#import "WSStatusCell.h"
#import "WSStatusCell_Mas.h"

static NSString * const title = @"首页";

@interface WSHomeController ()

@property (nonatomic, strong) NSMutableArray <WSStatusModel *> *statuses;

@end

@implementation WSHomeController


- (void)setupRootView {
    [super setupRootView];
    self.title = NSLocalizedString(title, nil);
    self.view.backgroundColor = [UIColor baseBackGroundColor];
    [self setLeftBarButtonWithImage:[UIImage imageNamed:@"navigationbar_friendattention"] highLightImage:[UIImage imageNamed:@"navigationbar_friendattention_highlighted"]];
    [self setRightBarButtonWithImage:[UIImage imageNamed:@"navigationbar_icon_radar"] highLightImage:[UIImage imageNamed:@"navigationbar_icon_radar_highlighted"]];
    [self.leftBarButton addTarget:self action:@selector(leftBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBarButton addTarget:self action:@selector(rightBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [WSCoreManager markID:@"HomePage" label:@""];
    self.enableFooterRefresh = true;
    self.enableHeaderRefresh = true;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    debugLog();
    [self sendRequest];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self showUnLoginViewWithType:WSUnloginViewHome];
}

- (void)showUnLoginViewWithType:(WSUnloginViewType)viewType {
    
    [super showUnLoginViewWithType:viewType];
    if (![WSUserModel isLogin]) {
        
    }
    
}

#pragma mark - tablview delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    debugLog();
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WSStatusCell_Mas *cell = [WSStatusCell_Mas statusCellWithTableView:tableView];
    cell.statusModel = self.statuses[indexPath.row];
    return cell;
}



#pragma mark - network

- (void)sendRequest {
    
    [self.tableView.mj_header beginRefreshing];
    [WSManager.statusService getHomeStatusesWithSince_id:[NSNumber numberWithInteger:0] max_id:[NSNumber numberWithInteger:0] count:20 page:1 feature:0 delegate:self];
}

- (void)requestFailedWithRes:(ResponseModel *)res {
    
}

- (void)requestSuccessedWithRes:(ResponseModel *)res {
    
    [self.statuses addObjectsFromArray:res.statuses];
    [self refreshData];
}

#pragma mark - event 

- (void)leftBarButtonClick {
    debugLog();
    [WSCoreManager markID:@"HomeLeft" label:@""];
    
    if ([self checkLogin]) {
        
    }
}

- (void)rightBarButtonClick {
    debugLog();
    [WSCoreManager markID:@"HomeRight" label:@""];
    if ([self checkLogin]) {
        
    }
}

#pragma mark - lazy loadind

- (NSMutableArray *)statuses {
    
    if (!_statuses) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

@end
