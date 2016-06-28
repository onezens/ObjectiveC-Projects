//
//  WSUserModel.h
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseModel.h"

@interface WSUserModel : BaseModel

@property (nonatomic, copy) NSString <Optional> *uid;
@property (nonatomic, copy) NSString <Optional> *name;
@property (nonatomic, copy) NSString <Optional> *access_token;

+ (instancetype)currentUser;
+ (BOOL)isLogin;
+ (void)logout;

@end
