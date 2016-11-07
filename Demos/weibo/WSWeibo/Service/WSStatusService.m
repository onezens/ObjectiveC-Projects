//
//  WSStatusService.m
//  WSWeibo
//
//  Created by onezen on 16/6/28.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSStatusService.h"
#import "WSStatusModel.h"

@implementation WSStatusService

- (NSString *)getHomeStatusesWithSince_id:(NSNumber *)since_id max_id:(NSNumber *)max_id count:(NSInteger)count page:(NSInteger)page feature:(WSHomeStatusType)feature delegate:(id<BaseServiceDelegate>)delegate{
    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    
    [para setValue:since_id forKey:@"since_id"];
    [para setValue:max_id forKey:@"max_id"];
    [para setValue:[NSNumber numberWithInteger:count] forKey:@"count"];
    [para setValue:[NSNumber numberWithInteger:page] forKey:@"page"];
    [para setValue:[NSNumber numberWithInteger:feature] forKey:@"feature"];
    WSUserModel *user = [WSUserModel currentUser];
    [para setValue:user.access_token forKey:@"access_token"];
    
    return [self getWithInterface:@"2/statuses/home_timeline.json" body:para reqName:ReqName_GetHomeStatus resObjClass:[WSStatusModel class] delegate:delegate needSave:NO];
}

@end
