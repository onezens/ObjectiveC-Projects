//
//  WSMessageController.m
//  WSWeibo
//
//  Created by onezen on 16/6/22.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSMessageController.h"

static NSString * const title = @"消息";

@implementation WSMessageController

- (void)setupRootView {
    [super setupRootView];
    self.title = NSLocalizedString(title, nil);
    self.view.backgroundColor = [UIColor baseBackGroundColor];
    [self setLeftBarButtonWithText:@"发现群"];
    [self setRightBarButtonWithImage:[UIImage imageNamed:@"navigationbar_icon_newchat"] highLightImage:[UIImage imageNamed:@"navigationbar_icon_newchat_highlight"]];
    [self.leftBarButton addTarget:self action:@selector(findGroup) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBarButton addTarget:self action:@selector(goMessage) forControlEvents:UIControlEventTouchUpInside];
    [WSCoreManager markID:@"MessagePage" label:@""];
    debugLog();
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self showUnLoginViewWithType:WSUnloginViewMessage];
}

#pragma mark - event

- (void)findGroup {
    
    debugLog();
    [WSCoreManager markID:@"findGroup" label:@""];
}

- (void)goMessage {
    debugLog();
    [WSCoreManager markID:@"goMessage" label:@""];
}

@end
