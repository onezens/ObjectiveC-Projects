//
//  WSOauthModel.h
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseModel.h"

@interface WSOauthModel : BaseModel

@property (nonatomic, copy) NSString <Optional> *access_token;
@property (nonatomic, copy) NSString <Optional> *expires_in;
@property (nonatomic, copy) NSString <Optional> *remind_in;
@property (nonatomic, copy) NSString <Optional> *uid;

@end
