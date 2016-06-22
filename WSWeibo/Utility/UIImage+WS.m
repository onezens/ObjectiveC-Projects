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

- (instancetype)compressImageWithMaxWidth:(CGFloat)width {
    
    UIImage *compressedImg = nil;
    CGFloat com_width = width;
    CGFloat com_height = width;
    
    if (self.size.width <= com_width) {
        if (self.size.height <= com_width) {
            return self;
        }else {
            com_width = self.size.width / self.size.height * com_height;
        }
    }else {
        com_height = self.size.height / self.size.width * com_width;
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(com_width, com_height));
    
    [self drawInRect:CGRectMake(0, 0, com_width, com_height)];
    
    compressedImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return compressedImg;
    
}

@end
