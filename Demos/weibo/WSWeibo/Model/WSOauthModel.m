//
//  WSOauthModel.m
//  WSWeibo
//
//  Created by onezen on 16/6/27.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSOauthModel.h"

@implementation WSOauthModel

+ (void)saveWithDic:(NSDictionary *)dic {
    
    NSString *token = [dic valueForKey:@"access_token"];
    NSString *expires_in = [dic valueForKey:@"expires_in"];
    NSString *uid = [dic valueForKey:@"uid"];
    
    [kUserDefault setValue:token forKey:@"token"];
    [kUserDefault setValue:expires_in forKey:@"expires_in"];
    [kUserDefault setValue:uid forKey:@"uid"];
}

@end
