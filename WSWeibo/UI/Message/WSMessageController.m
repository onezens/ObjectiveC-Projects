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

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = NSLocalizedString(title, nil);
    debugLog();
}

@end
