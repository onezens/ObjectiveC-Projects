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
    CGFloat offsetY = self.isHaveNav ? 64.0 : 0.0;
    CGFloat titLblW = self.titleLbl.bounds.size.width;
    CGFloat titLblH = self.titleLbl.bounds.size.height;
    CGFloat activityW = self.activity.bounds.size.width;
    CGFloat activityH = self.activity.bounds.size.height;
    CGFloat activityX = self.bounds.size.width - titLblW - activityW - margin;
    self.activity.frame = CGRectMake(activityX * 0.5, margin + offsetY, activityW, activityH);
    self.titleLbl.frame = CGRectMake(CGRectGetMaxX(self.activity.frame) + margin, margin + offsetY, titLblW, titLblH);
    
}

#pragma mark - lazy loading

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.text = @"正在加载...";
        _titleLbl.textColor = [UIColor grayColor];
        [_titleLbl sizeToFit];
        _titleLbl.font = [UIFont systemFontOfSize:14];
        [self addSubview:_titleLbl];
    }
    return _titleLbl;
}

- (UIActivityIndicatorView *)activity {
    
    if (!_activity) {
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activity startAnimating];
        [self addSubview:_activity];
    }
    return _activity;
}

@end
