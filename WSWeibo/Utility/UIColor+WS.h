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
+ (instancetype)baseNavTintColor;
+ (instancetype)baseNavPressedTintColor;
+ (instancetype)baseHightLightColor;
+ (instancetype)baseBackGroundColor;
+ (instancetype)baseSeperateLineColor;
+ (instancetype)baseTitleColor;
+ (instancetype)baseTextColor;
+ (instancetype)baseTextGrayColor;
+ (UIColor *)colorFromRGB:(NSInteger)rgbValue;

@end
