//
//  BaseModel.h
//  WSWeibo
//
//  Created by onezen on 16/6/12.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "JSONModel.h"

@interface BaseModel : JSONModel

+ (void)saveWithDic:(NSDictionary *)dic;

+ (void)saveWithArr:(NSArray *)arr;

+ (void)remove;

+ (BaseModel *)getCurrentSaveModel;

@end
