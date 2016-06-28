//
//  ResponseModel.h
//  WSWeibo
//
//  Created by wackosix on 16/6/15.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSStatusModel.h"

@interface ResponseModel : BaseModel

@property (nonatomic, copy) NSString <Optional> *reqName;
@property (nonatomic, strong) id <Optional> resObj;
@property (nonatomic, copy) NSString <Optional> *resInfo;
@property (nonatomic, strong) NSNumber <Optional> *status;
@property (nonatomic, strong) NSArray <Optional, WSStatusModel> *statuses;

+ (instancetype)resSuccessModelWithName:(NSString *)reqName response:(id)resObj;
+ (instancetype)resFailedModelWithName:(NSString *)reqName status:(NSInteger)status errorInfo:(NSString *)info;

@end
