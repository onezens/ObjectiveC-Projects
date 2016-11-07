//
//  WSToast.m
//  WSWeibo
//
//  Created by onezen on 16/8/8.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSToast.h"

NSTimeInterval showTime = 3;

@interface WSToast()



@end

@implementation WSToast


+ (void)showToast:(WSToastType)type {
    
    WSToast *toast = [[self alloc] init];
    toast.frame = [self getFrame];
    [[UIApplication sharedApplication].keyWindow addSubview:toast];
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];\
        self.layer.cornerRadius = 8.0f;
        self.layer.masksToBounds = true;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:[WSToast getFrame]];
}

+ (CGRect)getFrame {
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat y = [UIScreen mainScreen].bounds.size.height * 0.5;
    CGFloat width = 126.0f;
    return CGRectMake(x-width*0.5, y-width*0.5, width, width);
}


@end
