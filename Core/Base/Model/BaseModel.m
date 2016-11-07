//
//  BaseModel.m
//  WSWeibo
//
//  Created by onezen on 16/6/12.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
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
