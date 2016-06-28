//
//  ResponseModel.m
//  WSWeibo
//
//  Created by wackosix on 16/6/15.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "ResponseModel.h"

@implementation ResponseModel

+ (instancetype)resSuccessModelWithName:(NSString *)reqName response:(id)resObj {
    
    ResponseModel *res = [[ResponseModel alloc] init];
    res.reqName = reqName;
    res.resObj = resObj;
    res.status = @1;
    return res;
}
+ (instancetype)resFailedModelWithName:(NSString *)reqName status:(NSInteger)status errorInfo:(NSString *)info {
    
    ResponseModel *res = [[ResponseModel alloc] init];
    res.status = [NSNumber numberWithInteger:status];
    res.resInfo = info;
    res.reqName = reqName;
    return res;
    
}

@end
