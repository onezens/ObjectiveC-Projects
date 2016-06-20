//
//  UIColor+WS.h
//  WSWeibo
//
//  Created by wackosix on 16/6/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WS)

+ (instancetype)baseThemeColor;
+ (instancetype)navTintColor;
+ (instancetype)baseHightLightColor;
+ (UIColor *)colorFromRGB:(NSInteger)rgbValue;

@end