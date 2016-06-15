//
//  WSResModel.h
//  WSWeibo
//
//  Created by wackosix on 16/6/15.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSResModel : NSObject

@property (nonatomic, copy) NSString *reqName;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) id resObj;
@property (nonatomic, copy) NSString *resInfo;

+ (instancetype)resSuccessModelWithName:(NSString *)reqName response:(id)resObj;
+ (instancetype)resFailedModelWithName:(NSString *)reqName status:(NSInteger)status errorInfo:(NSString *)info;

@end
