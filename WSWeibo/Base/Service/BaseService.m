//
//  BaseService.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseService.h"
#import "WSHttpClient.h"
#import "ResponseModel.h"
#import "BaseModel.h"

@implementation BaseService

- (NSString *)getWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<BaseServiceDelegate>)delegate needSave:(BOOL)isNeed {
    
    NSString *url = [WS_API_GET stringByAppendingPathComponent:interface];
    __weak typeof(delegate) weakDel = delegate;
    WS(weakSelf);

    return [WSHttpClient sendGetWithURL:url body:body headers:nil success:^(NSString *reqId, id response) {
        [weakSelf requestSuccessName:name resposne:response delegate:weakDel resObjClass:resObjClass needSave:isNeed];
        
    } failed:^(NSString *reqId, NSError *error) {
        
        [weakSelf requestFailedName:name error:error delegate:weakDel];
    }];
}

- (NSString *)postWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<BaseServiceDelegate>)delegate needSave:(BOOL)isNeed {
    
    NSString *url = [WS_API_POST stringByAppendingPathComponent:interface];
    __weak typeof(delegate) weakDel = delegate;
    WS(weakSelf);
    
    return [WSHttpClient sendPostWithURL:url body:body headers:nil success:^(NSString *reqId, id response) {
        [weakSelf requestSuccessName:name resposne:response delegate:weakDel resObjClass:resObjClass needSave:isNeed];
    } failed:^(NSString *reqId, NSError *error) {
        [weakSelf requestFailedName:name error:error delegate:weakDel];
    }];
}

- (void)requestSuccessName:(NSString *)name resposne:(id)response delegate:(id)delegate resObjClass:(Class)resObjClass needSave:(BOOL)isNeed {
    
    if(resObjClass) { //需要进行转换为Model
        if ([response isKindOfClass:[NSDictionary class]]) {
            NSError *error = nil;
            id model = [[resObjClass alloc] initWithDictionary:response error:&error];
            if (!error) {
                ResponseModel *res = [ResponseModel resSuccessModelWithName:name response:model];
                if ([delegate respondsToSelector:@selector(requestSuccessedWithRes:)]) {
                    [delegate requestSuccessedWithRes:res];
                }
                if (isNeed) {
                    if ([resObjClass respondsToSelector:@selector(saveWithDic:)]) {
                        [resObjClass saveWithDic:response];
                    }
                }
            }else {
                WSLog(@"Model[JSONModel]转换失败:%@",error);
            }
            
        }else if ([response isKindOfClass:[NSArray class]]) {
            
            NSError *error = nil;
            NSArray *models = [resObjClass arrayOfDictionariesFromModels:response];
            if (!error) {
                ResponseModel *res = [ResponseModel resSuccessModelWithName:name response:models];
                if ([delegate respondsToSelector:@selector(requestSuccessedWithRes:)]) {
                    [delegate requestSuccessedWithRes:res];
                }
                if (isNeed) {
                    if ([resObjClass respondsToSelector:@selector(saveWithArr:)]) {
                        [resObjClass saveWithArr:models];
                    }
                }
            }else {
                WSLog(@"Model[JSONModel]转换失败:%@",error);
            }
        }
        
    }else { //不需要进行转换为Model
        
        ResponseModel *res = [ResponseModel resSuccessModelWithName:name response:response];
        if ([delegate respondsToSelector:@selector(requestSuccessedWithRes:)]) {
            [delegate requestSuccessedWithRes:res];
        }
    }
}

- (void)requestFailedName:(NSString *)name error:(NSError *)error delegate:(id)delegate{
    
    ResponseModel *res = [ResponseModel resFailedModelWithName:name status:0 errorInfo:error.description];
    if ([delegate respondsToSelector:@selector(requestFailedWithRes:)]) {
        [delegate requestFailedWithRes:res];
    }

}




@end
