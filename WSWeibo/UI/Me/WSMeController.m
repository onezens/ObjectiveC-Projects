//
//  WSMeController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/22.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSMeController.h"

static NSString * const title = @"我";

@implementation WSMeController

- (void)setupRootView {
    [super setupRootView];
    self.title = NSLocalizedString(title, nil);
    self.view.backgroundColor = [UIColor baseBackGroundColor];
    [self setLeftBarButtonWithText:@"添加好友"];
    [self setRightBarButtonWithText:@"设置"];
    [self.leftBarButton addTarget:self action:@selector(addFriend) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBarButton addTarget:self action:@selector(goSetting) forControlEvents:UIControlEventTouchUpInside];
    [WSCoreManager markID:@"MePage" label:@""];
    debugLog();
}


#pragma mark - event

- (void)addFriend {
    debugLog();
    [WSCoreManager markID:@"addFriend" label:@""];
}

- (void)goSetting {
    debugLog();
    [WSCoreManager markID:@"goSetting" label:@""];
}
@end
