//
//  WSUserService.h
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseService.h"

@interface WSUserService : BaseService

- (NSString *)getAccessToken:(NSString *)code delegate:(id<BaseServiceDelegate>)delegate;

@end
