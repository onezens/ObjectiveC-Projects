//
//  UIColor+WS.m
//  WSWeibo
//
//  Created by wackosix on 16/6/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "UIColor+WS.h"

@implementation UIColor (WS)

+ (instancetype)baseThemeColor {
    return [UIColor colorFromRGB:0xff8200];
}

+( instancetype)baseHightLightColor {
    
    return [UIColor colorFromRGB:0xff8200];
}

+ (instancetype)baseNavTintColor {
    return [UIColor colorFromRGB:0x818181];
}

+ (instancetype)baseNavPressedTintColor {
    return [UIColor colorFromRGB:0xff8200];
}

+ (instancetype)baseBackGroundColor {
    
    return [UIColor colorFromRGB:0xF4F4F4];
}

+ (UIColor *)colorFromRGB:(NSInteger)rgbValue {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.f
                           green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.f
                            blue:((float)(rgbValue & 0x0000FF)) / 255.f alpha:1.f];
}


@end
