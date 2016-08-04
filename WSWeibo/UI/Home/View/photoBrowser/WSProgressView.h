//
//  WSProgressView.h
//  WSWeibo
//
//  Created by wackosix on 16/8/4.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WSProgressType) {
    WSProgressDefault,
};

@interface WSProgressView : UIView

@property (nonatomic, assign) CGFloat currentProgress;
@property (nonatomic, assign) CGFloat totalProgress;
@property (nonatomic, assign) WSProgressType type;

+ (instancetype)showProgressWithType:(WSProgressType)type;

@end
