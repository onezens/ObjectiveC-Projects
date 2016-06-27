//
//  BaseModel.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "JSONModel.h"

@interface BaseModel : JSONModel

+ (void)saveWithDic:(NSDictionary *)dic;

+ (void)saveWithArr:(NSArray *)arr;

+ (void)remove;

+ (BaseModel *)getCurrentSaveModel;

@end
