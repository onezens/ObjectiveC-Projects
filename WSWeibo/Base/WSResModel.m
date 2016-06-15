//
//  WSResModel.m
//  WSWeibo
//
//  Created by wackosix on 16/6/15.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSResModel.h"

@implementation WSResModel

+ (instancetype)resSuccessModelWithName:(NSString *)reqName response:(id)resObj{
    
    WSResModel *res = [[WSResModel alloc] init];
    res.reqName = reqName;
    res.resObj = resObj;
    res.status = 1;
    return res;
}
+ (instancetype)resFailedModelWithName:(NSString *)reqName status:(NSInteger)status errorInfo:(NSString *)info{
    
    WSResModel *res = [[WSResModel alloc] init];
    res.status = status;
    res.resInfo = info;
    res.reqName = reqName;
    return res;
    
}

@end
