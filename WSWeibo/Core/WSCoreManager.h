//
//  WSCoreManager.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSUserService.h"
#import "WSStatusService.h"

typedef void (^AlertCompletedBlock)();

#define WSManager [WSCoreManager shareCoreManager]

@interface WSCoreManager : NSObject

@property (nonatomic, strong) WSUserService *userService;
@property (nonatomic, strong) WSStatusService *statusService;

+ (instancetype)shareCoreManager;

/**
 *  统计或者标识一个事件或者其他
 *
 *  @param Id  统计标识
 *  @param label 注释，标签
 */
+ (void)markID:(NSString *)Id label:(NSString *)label;

/**
 *  @param title        标题，粗体，可以为空
 *  @param message      消息，正常字体，可以为空
 *  @param cancelTitle  取消的标题
 *  @param cancel       取消的block回调, 注意使用weak，否则会循环引用
 *  @param confirmTitle 确定标题
 *  @param confirm      确定的block回调, 注意使用weak，否则会循环引用
 */
- (id)showAlert:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(AlertCompletedBlock)cancel confirmTitle:(NSString *)confirmTitle confirmBlock:(AlertCompletedBlock)confirm;

@end
