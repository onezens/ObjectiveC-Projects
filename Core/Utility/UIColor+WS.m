//
//  UIColor+WS.m
//  WSWeibo
//
//  Created by onezen on 16/6/20.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "UIColor+WS.h"

@implementation UIColor (WS)

+ (instancetype)baseThemeColor {
    return [UIColor colorFromRGB:0xff8200];
}

+ (instancetype)baseHightLightColor {
    
    return [UIColor colorFromRGB:0xff8200];
}

+ (instancetype)baseNavTintColor {
    return [UIColor colorFromRGB:0x818181];
}

+ (instancetype)baseTitleColor {
    
    return [UIColor colorFromRGB:0x525252];
}

+ (instancetype)retweetViewColor {
    
    return [UIColor colorFromRGB:0xf7f7f7];
}

+ (instancetype)baseTextColor {
    
    return [UIColor colorFromRGB:0x333333];
}

+ (instancetype)baseNavPressedTintColor {
    return [UIColor colorFromRGB:0xff8200];
}

+ (instancetype)baseTextGrayColor {
    
    return [UIColor colorFromRGB:0x939393];
}

+ (instancetype)baseBackGroundColor {
    
    return [UIColor colorFromRGB:0xF4F4F4];
}

+ (instancetype)baseSeperateLineColor {
    
    return [UIColor colorFromRGB:0xe8e8e8];
}

+ (UIColor *)colorFromRGB:(NSInteger)rgbValue {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.f
                           green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.f
                            blue:((float)(rgbValue & 0x0000FF)) / 255.f alpha:1.f];
}


@end
