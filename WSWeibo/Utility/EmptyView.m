//
//  EmptyView.m
//  WSWeibo
//
//  Created by wackosix on 16/6/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "EmptyView.h"

@interface EmptyView ()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIActivityIndicatorView *activity;

@end

@implementation EmptyView

- (instancetype)init {
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor baseBackGroundColor];
        [self titleLbl];
        [self activity];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat margin = 8;
    CGFloat titLblW = self.titleLbl.bounds.size.width;
    CGFloat titLblH = self.titleLbl.bounds.size.height;
    CGFloat activityW = self.activity.bounds.size.width;
    CGFloat activityH = self.activity.bounds.size.height;
    CGFloat titLblX = self.bounds.size.width - titLblW - activityW - margin;
    self.titleLbl.frame = CGRectMake(titLblX * 0.5, margin, titLblW, titLblH);
    self.activity.frame = CGRectMake(CGRectGetMaxX(self.titleLbl.frame) + margin, margin, activityW, activityH);
}

#pragma mark - lazy loading

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.text = @"正在加载...";
        [_titleLbl sizeToFit];
        [self addSubview:_titleLbl];
    }
    return _titleLbl;
}

- (UIActivityIndicatorView *)activity {
    
    if (!_activity) {
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [_activity startAnimating];
    }
    return _activity;
}

@end
