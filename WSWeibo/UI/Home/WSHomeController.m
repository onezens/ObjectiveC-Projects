//
//  WSHomeController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/22.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSHomeController.h"
#import "WSOauthController.h"

static NSString * const title = @"首页";

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

#pragma mark - network

- (void)sendRequest {
    
    [WSManager.statusService getHomeStatusesWithSince_id:[NSNumber numberWithInteger:0] max_id:[NSNumber numberWithInteger:0] count:20 page:1 feature:0 delegate:self];
}

- (void)requestFailedWithRes:(ResponseModel *)res {
    
}

- (void)requestSuccessedWithRes:(ResponseModel *)res {
    
    
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

@end
