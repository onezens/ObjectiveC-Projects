//
//  WSBaseModel.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSBaseModel.h"

@implementation WSBaseModel

+(JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}


+ (void)saveWithDic:(NSDictionary *)dic{
    
}

+ (void)remove{
    
}


+ (WSBaseModel *)getCurrentSaveModel{
    return nil;
}


@end
