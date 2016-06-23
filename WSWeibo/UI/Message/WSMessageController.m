//
//  WSMessageController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/22.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
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
    debugLog();
}

#pragma mark - event

- (void)findGroup {
    
    debugLog();
}

- (void)goMessage {
    debugLog();
}

@end
