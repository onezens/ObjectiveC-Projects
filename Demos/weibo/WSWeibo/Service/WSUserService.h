//
//  WSUserService.h
//  WSWeibo
//
//  Created by onezen on 16/6/27.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "BaseService.h"

@interface WSUserService : BaseService

- (NSString *)getAccessToken:(NSString *)code delegate:(id<BaseServiceDelegate>)delegate;

@end
