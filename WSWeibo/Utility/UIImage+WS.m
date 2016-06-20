//
//  UIImage+WS.m
//  WSWeibo
//
//  Created by wackosix on 16/6/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "UIImage+WS.h"

@implementation UIImage (WS)

- (instancetype)renderImageWithColor:(UIColor *)color {
    
    UIImage *image = nil;
    
    UIGraphicsBeginImageContextWithOptions(self.size, false, [[UIScreen mainScreen] scale]);
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    [color setFill];
    
    UIRectFill(rect);
    
    [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
