//
//  WSBaseModel.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "JSONModel.h"

@interface WSBaseModel : JSONModel

+ (void)saveWithDic:(NSDictionary *)dic;

+ (void)remove;

+ (WSBaseModel *)getCurrentSaveModel;

@end
