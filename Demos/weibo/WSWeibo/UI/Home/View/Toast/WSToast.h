//
//  WSToast.h
//  WSWeibo
//
//  Created by onezen on 16/8/8.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WSToastType) {
    WSToastText,
    WSToastSuccess,
    WSToastWarn
};

@interface WSToast : UIView

+(void)showToast:(WSToastType)type;

@end
