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
}

#pragma mark - event 

- (void)leftBarButtonClick {
    debugLog();
    [WSCoreManager markID:@"HomeLeft" label:@""];
    
    UINavigationController *vc = [WSOauthController OauthController];
    [self presentViewController:vc animated:true completion:nil];
}

- (void)rightBarButtonClick {
    debugLog();
    [WSCoreManager markID:@"HomeRight" label:@""];
}

@end
