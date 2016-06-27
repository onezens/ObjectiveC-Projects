//
//  WSHttpClient.m
//  WSWeibo
//
//  Created by wackosix on 16/6/14.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSHttpClient.h"
#import "AFNetworking.h"

@interface WSHttpClient ()

@property (nonatomic, strong) NSMutableDictionary <NSString *, NSString *> *headers;
@property (nonatomic, strong) NSMutableArray <NSURLSessionTask *> *httpQueue;

@end


@implementation WSHttpClient

static id _instance;


- (NSString *)sendGetWithURL:(NSString *)url body:(NSDictionary *)body headers:(NSDictionary *)header success:(HttpRequestSuccessBlock)sucess failed:(HttpRequestFailedBlock)failed{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [header enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/plain", nil]];
    NSURLSessionDataTask *task = [manager GET:url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hanlderSuccessWithTask:task response:responseObject success:sucess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hanlderFailedWithTask:task error:error failed:failed];
    }];
    
    [self.httpQueue addObject:task];
    return [NSString stringWithFormat:@"%zd",task.taskIdentifier];
    
}

- (NSString *)sendPostWithURL:(NSString *)url body:(NSDictionary *)body headers:(NSDictionary *)header success:(HttpRequestSuccessBlock)sucess failed:(HttpRequestFailedBlock)failed{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/plain", nil]];
    NSMutableDictionary *headers_dict = [NSMutableDictionary dictionaryWithDictionary:header];
    [headers_dict setValuesForKeysWithDictionary:self.headers];
    [header enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
    NSURLSessionDataTask *task = [manager POST:url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hanlderSuccessWithTask:task response:responseObject success:sucess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hanlderFailedWithTask:task error:error failed:failed];
    }];
    
    [self.httpQueue addObject:task];
    return [NSString stringWithFormat:@"%zd",task.taskIdentifier];
}

- (instancetype)init {
    
    self = [super init];
    self.headers = [NSMutableDictionary dictionary];
    self.httpQueue = [NSMutableArray array];
    return self;
}

- (void)hanlderSuccessWithTask:(NSURLSessionDataTask *)task response:(id)obj success:(HttpRequestSuccessBlock)success {
    
    success([self getReqId:task], obj);
    [self.httpQueue removeObject:task];
}

- (void)hanlderFailedWithTask:(NSURLSessionDataTask *)task error:(NSError *)error failed:(HttpRequestFailedBlock)failed {
    
    failed([self getReqId:task], error);
    [self.httpQueue removeObject:task];
}

- (NSURLSessionDataTask *)taskForReqId:(NSString *)reqId {
    
    for (NSURLSessionDataTask *task in self.httpQueue) {
        if (task.taskIdentifier == reqId.integerValue) {
            return task;
            break;
        }
    }
    return nil;
}


- (NSString *)getReqId:(NSURLSessionDataTask *)task {
    
    return [NSString stringWithFormat:@"%zd",task.taskIdentifier];
}

+ (instancetype)sharedHttpClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}


+ (NSString *)sendGetWithURL:(NSString *)url body:(NSDictionary *)body headers:(NSDictionary *)header success:(HttpRequestSuccessBlock)sucess failed:(HttpRequestFailedBlock)failed{
    
    return [[WSHttpClient sharedHttpClient] sendGetWithURL:url body:body headers:header success:sucess failed:failed];
    
}

+ (NSString *)sendPostWithURL:(NSString *)url body:(NSDictionary *)body headers:(NSDictionary *)header success:(HttpRequestSuccessBlock)sucess failed:(HttpRequestFailedBlock)failed{
    
    return [[WSHttpClient sharedHttpClient] sendPostWithURL:url body:body headers:header success:sucess failed:failed];
}


+ (void)cancelRequestWithReqId:(NSString *)reqId{
    
    NSURLSessionTask *task = [[WSHttpClient sharedHttpClient] taskForReqId:reqId];
    [[WSHttpClient sharedHttpClient].httpQueue removeObject:task];
}

+ (void)cancelAllRequest{
    
    [[WSHttpClient sharedHttpClient].httpQueue removeAllObjects];
}

+ (void)resumeRequestWithReqId:(NSString *)reqId{
    
    NSURLSessionTask *task = [[WSHttpClient sharedHttpClient] taskForReqId:reqId];
    [task resume];
}

+ (void)suspendRequestWithReqId:(NSString *)reqId {
    NSURLSessionTask *task = [[WSHttpClient sharedHttpClient] taskForReqId:reqId];
    [task suspend];
}

+ (void)setHeaders:(NSDictionary *)headers {
    
    [[WSHttpClient sharedHttpClient].headers setValuesForKeysWithDictionary:headers];
}

+ (void)removeAllHeaders {
    
    [[WSHttpClient sharedHttpClient].headers removeAllObjects];
    
}

@end
