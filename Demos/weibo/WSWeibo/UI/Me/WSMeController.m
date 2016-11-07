//
//  WSMeController.m
//  WSWeibo
//
//  Created by onezen on 16/6/22.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSMeController.h"

static NSString * const title = @"我";

@implementation WSMeController

- (void)setupRootView {
    [super setupRootView];
    self.title = NSLocalizedString(title, nil);
    self.view.backgroundColor = [UIColor baseBackGroundColor];
//    [self setLeftBarButtonWithText:@"添加好友"];
    [self setLeftBarButtonWithText:@"注销"];
    [self setRightBarButtonWithText:@"设置"];
    [self.leftBarButton addTarget:self action:@selector(addFriend) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBarButton addTarget:self action:@selector(goSetting) forControlEvents:UIControlEventTouchUpInside];
    [WSCoreManager markID:@"MePage" label:@""];
    debugLog();
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self showUnLoginViewWithType:WSUnloginViewMe];
}


#pragma mark - event

- (void)addFriend {
    debugLog();
    [WSCoreManager markID:@"addFriend" label:@""];
    [WSUserModel logout];
    [self viewWillAppear:true];
}

- (void)goSetting {
    debugLog();
    [WSCoreManager markID:@"goSetting" label:@""];
}
@end
