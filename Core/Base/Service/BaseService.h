//
//  BaseService.h
//  WSWeibo
//
//  Created by onezen on 16/6/12.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseModel;

typedef enum : NSUInteger {
    ServiceDefault
} ServiceType;

@protocol BaseServiceDelegate <NSObject>

- (void)requestSuccessedWithRes:(ResponseModel *)res;
- (void)requestFailedWithRes:(ResponseModel *)res;

@end

@interface BaseService : NSObject

@property (nonatomic, assign) ServiceType type;
@property (nonatomic, weak) id <BaseServiceDelegate> delegate;

- (NSString *)getWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<BaseServiceDelegate>)delegate needSave:(BOOL)isNeed;

- (NSString *)postWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<BaseServiceDelegate>)delegate needSave:(BOOL)isNeed;


@end
