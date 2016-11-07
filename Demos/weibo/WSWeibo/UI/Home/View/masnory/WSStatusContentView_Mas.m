//
//  WSStatusContentView_Mas.m
//  WSWeibo
//
//  Created by onezen on 16/7/11.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSStatusContentView_Mas.h"
#import "photoBrowserView.h"

@interface WSStatusContentView_Mas ()

@property (nonatomic, strong) UILabel *contentLbl;
@property (nonatomic, weak) MASConstraint *topOffset;
@property (nonatomic, weak) MASConstraint *bottomOffset;
@property (nonatomic, strong) photoBrowserView *photoView;
@property (nonatomic, weak) MASConstraint *photoHeight;

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




- (void)setStatus:(WSStatusModel *)status {
    
    _status = status;
    self.contentLbl.text = status.text;
    self.photoView.urls = status.pic_urls;
    
    if (!status) {
        self.topOffset.offset(0);
        self.bottomOffset.offset(0);
        self.photoHeight.offset(0);
        
    }else {
        self.bottomOffset.offset(-8);
        self.topOffset.offset(status.text==nil ? 0 : 8);
        self.photoHeight.equalTo(self.photoView.height);
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
            make.bottom.equalTo(self.photoView.top);
            
        }];
    }
    return _contentLbl;
}

- (photoBrowserView *)photoView {
    
    if (!_photoView) {
        _photoView = [[photoBrowserView alloc] init];
        [self addSubview:_photoView];
        [_photoView makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            self.bottomOffset = make.bottom.equalTo(self).offset(-8);
            self.photoHeight = make.height.equalTo(0);
        }];
    }
    return _photoView;
}


@end
