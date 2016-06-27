//
//  BaseModel.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+(JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}


+ (void)saveWithDic:(NSDictionary *)dic{
    
}

+ (void)saveWithArr:(NSArray *)arr {
    
}

+ (void)remove{
    
}


+ (BaseModel *)getCurrentSaveModel{
    return nil;
}


@end
