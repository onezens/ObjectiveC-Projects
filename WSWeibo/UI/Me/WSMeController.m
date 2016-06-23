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

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = NSLocalizedString(title, nil);
    debugLog();
}

@end
