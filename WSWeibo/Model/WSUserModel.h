//
//  WSUserModel.h
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseModel.h"

@interface WSUserModel : BaseModel

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *access_token;

+ (instancetype)currentUser;
+ (BOOL)isLogin;
+ (void)logout;

@end
