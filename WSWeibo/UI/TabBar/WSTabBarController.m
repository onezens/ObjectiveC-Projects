//
//  WSTabBarController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/22.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSTabBarController.h"
#import "WSHomeController.h"
#import "WSDiscoveryController.h"
#import "WSMessageController.h"
#import "WSMeController.h"
#import "WSComposeController.h"

@implementation WSTabBarController

- (void)viewDidLoad {
    
}

- (void)setRootVC {
    
    self.viewControllers = @[[self loadVCWithTitle:@"主页" vc:[WSHomeController class]], [self loadVCWithTitle:@"消息" vc:[WSMessageController class]], [self loadVCWithTitle:@"发现" vc:[WSDiscoveryController class]], [self loadVCWithTitle:@"我" vc:[WSMeController class]]];
}

- (BaseViewController *)loadVCWithTitle:(NSString *)title vc:(Class)vcClass{
   
    BaseViewController *vc = [[vcClass alloc] init];
    vc.title = title;
    return vc;
}

- (void)dealloc {
    debugLog();
}


@end
