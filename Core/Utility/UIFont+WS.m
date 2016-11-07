//
//  UIFont+WS.m
//  WSWeibo
//
//  Created by onezen on 16/6/23.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "UIFont+WS.h"

@implementation UIFont (WS)

+ (instancetype)baseFont {
    
    return [UIFont systemFontOfSize:15];
}
+ (instancetype)navTitleFont {
    return [UIFont boldSystemFontOfSize:17];
}
+ (instancetype)navItemTitleFont{
    return [UIFont systemFontOfSize:15];
}

@end
