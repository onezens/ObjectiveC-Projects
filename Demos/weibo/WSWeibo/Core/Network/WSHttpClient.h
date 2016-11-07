//
//  WSHttpClient.h
//  WSWeibo
//
//  Created by onezen on 16/6/14.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpRequestSuccessBlock)(NSString *reqId, id response);
typedef void(^HttpRequestFailedBlock)(NSString *reqId, NSError *error);

@interface WSHttpClient : NSObject

+ (NSString *)sendGetWithURL:(NSString *)url body:(NSDictionary *)body headers:(NSDictionary<NSString *, NSString *> *)header success:(HttpRequestSuccessBlock)sucess failed:(HttpRequestFailedBlock)failed;

+ (NSString *)sendPostWithURL:(NSString *)url body:(NSDictionary *)body headers:(NSDictionary<NSString *, NSString *> *)header success:(HttpRequestSuccessBlock)sucess failed:(HttpRequestFailedBlock)failed;

+ (void)cancelRequestWithReqId:(NSString *)reqId;

+ (void)cancelAllRequest;

+ (void)resumeRequestWithReqId:(NSString *)reqId;

+ (void)suspendRequestWithReqId:(NSString *)reqId;

+ (void)setHeaders:(NSDictionary *)headers;

+ (void)removeAllHeaders;

@end
