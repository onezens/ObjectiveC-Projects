//
//  UIView+WS.m
//  WSWeibo
//
//  Created by wackosix on 16/6/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "UIView+WS.h"

@implementation UIView (WS)


- (CGFloat)f_left {
    return self.frame.origin.x;
}

- (void)setF_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)f_top {
    return self.frame.origin.y;
}

- (void)setF_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)f_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setF_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)f_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setF_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


- (CGFloat)f_width {
    return self.frame.size.width;
}

- (void)setF_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)f_height {
    return self.frame.size.height;
}

- (void)setF_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Quick Access

- (CGPoint)f_origin {
    return self.frame.origin;
}

- (void)setF_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)f_size {
    return self.frame.size;
}

- (void)setF_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


- (CGFloat)f_centerX{
    return self.center.x;
}

- (void)setF_centerX:(CGFloat)centerX{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)f_centerY{
    return self.center.y;
}

- (void)setF_centerY:(CGFloat)centerY{
    self.center = CGPointMake(self.center.x, centerY);
}
@end
