//
//  WSStatusContentView_Mas.m
//  WSWeibo
//
//  Created by wackosix on 16/7/11.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSStatusContentView_Mas.h"

@interface WSStatusContentView_Mas ()

@property (nonatomic, strong) UILabel *contentLbl;
@property (nonatomic, weak) MASConstraint *topOffset;
@property (nonatomic, weak) MASConstraint *bottomOffset;

@end

@implementation WSStatusContentView_Mas

#pragma mark - basic

+ (instancetype)statusContentView {
    
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self contentLbl];
    }
    return self;
}


- (void)setContent:(NSString *)content {
    
    self.contentLbl.text = content;
    if (content == nil) {
        
        self.topOffset.offset(0);
        self.bottomOffset.offset(0);
    }else {
        self.topOffset.offset(8);
        self.bottomOffset.offset(-8);
    }
}

#pragma mark - lazy loading

- (UILabel *)contentLbl {
    
    if (!_contentLbl) {
        _contentLbl = [[UILabel alloc] init];
        _contentLbl.font = [UIFont baseFont];
        _contentLbl.numberOfLines = 0;
        [self addSubview:_contentLbl];
        [_contentLbl makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.equalTo(self).offset(8);
            make.trailing.equalTo(self).offset(-8);
            self.topOffset = make.top.equalTo(self).offset(8);
            self.bottomOffset = make.bottom.equalTo(self).offset(-8);
            
        }];
    }
    return _contentLbl;
}


@end
