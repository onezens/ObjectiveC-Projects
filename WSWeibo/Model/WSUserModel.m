//
//  WSUserModel.m
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSUserModel.h"

@implementation WSUserModel

+ (instancetype)currentUser {
    
    WSUserModel *user = [[WSUserModel alloc] init];
    user.uid = [kUserDefault valueForKey:@"uid"];
    user.access_token = [kUserDefault valueForKey:@"token"];
    return user;
}

+ (BOOL)isLogin {
    NSString *token = [kUserDefault valueForKey:@"token"];
    return token.length>0;
}

+ (void)logout {
    [kUserDefault removeObjectForKey:@"token"];
    [kUserDefault removeObjectForKey:@"uid"];
}

@end
