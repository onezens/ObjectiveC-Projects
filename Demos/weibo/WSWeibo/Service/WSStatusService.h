//
//  WSStatusService.h
//  WSWeibo
//
//  Created by onezen on 16/6/28.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "BaseService.h"

typedef NS_ENUM(NSUInteger, WSHomeStatusType) {
    WSHomeStatusAll,         //全部
    WSHomeStatusOriginate,  //原创
    WSHomeStatusPhoto,      //图片
    WSHomeStatusVideo,      //视频
    WSHomeStatusMusic       //音频
};

@interface WSStatusService : BaseService

/**
 *  获取首页微博
 *
 *  @param since_id 获取id大于since_id的微博
 *  @param max_id   获取id小于max_id微博
 *  @param count    一次性来的个数默认20，最大不超过100
 *  @param page     页数
 *  @param feature  过滤的类型，默认是all
 *
 */
- (NSString *)getHomeStatusesWithSince_id:(NSNumber *)since_id max_id:(NSNumber *)max_id count:(NSInteger)count page:(NSInteger)page feature:(WSHomeStatusType)feature delegate:(id<BaseServiceDelegate>)delegate;

@end
