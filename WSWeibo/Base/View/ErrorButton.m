//
//  ErrorButton.m
//  WSWeibo
//
//  Created by wackosix on 16/6/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "ErrorButton.h"

@implementation ErrorButton

- (instancetype)init {
    
    if (self = [super init]) {
     
        [self setImage:[UIImage imageNamed:@"img_nowifi"] forState:UIControlStateNormal];
        [self setTitle:@"页面加载失败,点击屏幕重新加载" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.backgroundColor = [UIColor baseBackGroundColor];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

- (void)layoutSubviews {
 
    [super layoutSubviews];
    CGFloat margin = 8;
    [self.imageView sizeToFit];
    [self.titleLabel sizeToFit];
    self.imageView.center = CGPointMake(self.center.x, self.center.y - (self.titleLabel.bounds.size.height + margin) * 0.5);
    self.titleLabel.center = CGPointMake(self.center.x, self.imageView.center.y + margin + self.titleLabel.bounds.size.height * 0.5 + self.imageView.bounds.size.height * 0.5);
}

@end
