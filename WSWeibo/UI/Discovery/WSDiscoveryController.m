//
//  WSDiscoveryController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/22.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSDiscoveryController.h"

static NSString * const title = @"发现";

@interface WSDiscoveryController ()

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation WSDiscoveryController

- (void)setupRootView {
    [super setupRootView];
    self.view.backgroundColor = [UIColor baseBackGroundColor];
    self.navigationItem.titleView = self.searchBar;
    [WSCoreManager markID:@"DiscoveryPage" label:@""];
    debugLog();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.searchBar endEditing:true];
}

#pragma mark - lazy loading

- (UISearchBar *)searchBar {
    
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
    }
    return _searchBar;
}

@end
