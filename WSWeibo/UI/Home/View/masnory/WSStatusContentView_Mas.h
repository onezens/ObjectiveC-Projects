//
//  WSStatusContentView_Mas.h
//  WSWeibo
//
//  Created by wackosix on 16/7/11.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSStatusModel;

@interface WSStatusContentView_Mas : UIView

@property (nonatomic, strong) WSStatusModel *status;

+ (instancetype)statusContentView;


@end
