//
//  WSProgressView.m
//  WSWeibo
//
//  Created by onezen on 16/8/4.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSProgressView.h"

@interface WSProgressView ()

@property (nonatomic, assign) CGFloat progress;

@end

@implementation WSProgressView


- (void)drawRect:(CGRect)rect {
    
    if (self.type == WSProgressDefault) {
        
        CGFloat radius = rect.size.width * 0.5;
        CGFloat span = 3;
        
        //里面变化的填充圆
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
        CGContextAddArc(ctx, center.x, center.y, radius-span, 0, M_PI * 2 * _progress, 0);
        CGContextAddLineToPoint(ctx, center.x, center.y);
        [[UIColor whiteColor] setFill];
        CGContextFillPath(ctx);
        
        //外面固定的圆
         [[UIColor whiteColor] setStroke];
        CGContextAddArc(ctx, center.x, center.y, radius, 0, M_PI * 2, 0);
        CGContextStrokePath(ctx);
        
    }
    self.layer.cornerRadius = rect.size.width * 0.5;
    self.layer.masksToBounds = true;
    
}

- (void)setCurrentProgress:(CGFloat)currentProgress {
    
    _currentProgress = currentProgress;
    _progress = _currentProgress / _totalProgress;
    NSLog(@"%f", _progress);
    [self setNeedsDisplay];
}

+(instancetype)showProgressWithType:(WSProgressType)type {
    
    WSProgressView *view = [[WSProgressView alloc] init];
    view.type = type;
    return view;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }
    return self;
}

- (void)dealloc {
    
    debugLog();
}


@end
