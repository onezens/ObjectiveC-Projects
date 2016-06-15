//
//  WSBaseService.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WSResModel;

typedef enum : NSUInteger {
    WSServiceDefault
} WSServiceType;

@protocol WSBaseServiceDelegate <NSObject>

- (void)requestSuccess:(WSResModel *)res;
- (void)requestFailed:(WSResModel *)res;

@end

@interface WSBaseService : NSObject

@property (nonatomic, assign) WSServiceType type;
@property (nonatomic, weak) id <WSBaseServiceDelegate> delegate;

- (NSString *)getWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<WSBaseServiceDelegate>)delegate needSave:(BOOL)isNeed;

- (NSString *)postWithInterface:(NSString *)interface body:(NSMutableDictionary *)body reqName:(NSString *)name resObjClass:(Class)resObjClass delegate:(id<WSBaseServiceDelegate>)delegate needSave:(BOOL)isNeed;


@end
