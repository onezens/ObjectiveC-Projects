//
//  WSBaseService.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSBaseService.h"
#import "WSHttpClient.h"
#import "WSResModel.h"
#import "WSBaseModel.h"

@implementation WSBaseService

- (NSString *)getWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<WSBaseServiceDelegate>)delegate needSave:(BOOL)isNeed {
    
    NSString *url = [WS_API_GET stringByAppendingPathComponent:interface];
    
    __weak typeof(delegate) weakDel = delegate;
    WS(weakSelf);

    return [WSHttpClient sendGetWithURL:url body:body headers:nil success:^(NSString *reqId, id response) {
        [weakSelf requestSuccessName:name resposne:response delegate:weakDel resObjClass:resObjClass];
        
    } failed:^(NSString *reqId, NSError *error) {
        
        [weakSelf requestFailedName:name error:error delegate:weakDel];
    }];
}

- (NSString *)postWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<WSBaseServiceDelegate>)delegate needSave:(BOOL)isNeed {
    
    NSString *url = [WS_API_POST stringByAppendingPathComponent:interface];
    __weak typeof(delegate) weakDel = delegate;
    WS(weakSelf);
    
    return [WSHttpClient sendPostWithURL:url body:body headers:nil success:^(NSString *reqId, id response) {
        [weakSelf requestSuccessName:name resposne:response delegate:weakDel resObjClass:resObjClass];
    } failed:^(NSString *reqId, NSError *error) {
        [weakSelf requestFailedName:name error:error delegate:weakDel];
    }];
}

- (void)requestSuccessName:(NSString *)name resposne:(id)response delegate:(id)delegate resObjClass:(Class)resObjClass{
    
    if(resObjClass) { //需要进行转换为Model
        if ([response isKindOfClass:[NSDictionary class]]) {
            NSError *error = nil;
            WSBaseModel *model = [[WSBaseModel alloc] initWithDictionary:response error:&error];
            if (!error) {
                WSResModel *res = [WSResModel resSuccessModelWithName:name response:model];
                if ([delegate respondsToSelector:@selector(requestSuccess:)]) {
                    [delegate requestSuccess:res];
                }
            }else {
                WSLog(@"Model[JSONModel]转换失败:%@",error);
            }
            
        }else if ([response isKindOfClass:[NSArray class]]) {
            
            NSError *error = nil;
            NSArray *models = [WSBaseModel arrayOfDictionariesFromModels:response];
            if (!error) {
                WSResModel *res = [WSResModel resSuccessModelWithName:name response:models];
                if ([delegate respondsToSelector:@selector(requestSuccess:)]) {
                    [delegate requestSuccess:res];
                }
            }else {
                WSLog(@"Model[JSONModel]转换失败:%@",error);
            }
        }
        
    }else { //不需要进行转换为Model
        
        WSResModel *res = [WSResModel resSuccessModelWithName:name response:response];
        if ([delegate respondsToSelector:@selector(requestSuccess:)]) {
            [delegate requestSuccess:res];
        }
    }
}

- (void)requestFailedName:(NSString *)name error:(NSError *)error delegate:(id)delegate{
    
    WSResModel *res = [WSResModel resFailedModelWithName:name status:0 errorInfo:error.description];
    if ([delegate respondsToSelector:@selector(requestFailed:)]) {
        [delegate requestFailed:res];
    }

}




@end
