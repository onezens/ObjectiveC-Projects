//
//  WSDiscoveryController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/22.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSDiscoveryController.h"

static NSString * const title = @"发现";

@implementation WSDiscoveryController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = NSLocalizedString(title, nil);
    debugLog();
}

@end
