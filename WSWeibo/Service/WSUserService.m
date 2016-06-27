//
//  WSUserService.m
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSUserService.h"
#import "WSOauthModel.h"

@implementation WSUserService

- (NSString *)getAccessToken:(NSString *)code delegate:(id<BaseServiceDelegate>)delegate {
    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    
    [para setValue:WS_WEIBO_APPKEY forKey:@"client_id"];
    [para setValue:WS_WEIBO_APPSEC forKey:@"client_secret"];
    [para setValue:WS_WEIBO_REDIRECTURL forKey:@"redirect_uri"];
    [para setValue:code forKey:@"code"];
    [para setValue:@"authorization_code" forKey:@"grant_type"];
    
    return [self postWithInterface:@"oauth2/access_token" body:para reqName:ReqName_GetAccessToken resObjClass:[WSOauthModel class] delegate:delegate needSave:true];
}

@end
