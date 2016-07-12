//
//  WSStatusToolBarView.m
//  WSWeibo
//
//  Created by wackosix on 16/7/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSStatusToolBarView.h"

@interface WSStatusToolBarView ()

@property (nonatomic, strong) UIButton *retweetBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIImageView *seperateLine1;
@property (nonatomic, strong) UIImageView *seperateLine2;

@end

@implementation WSStatusToolBarView


+ (instancetype)toolBar {
    
    return [[self alloc] init];
}

- (instancetype)init {
    
    if (self = [super init]) {
        [self likeBtn];
    }
    return self;
}

#pragma mark - lazy loading

- (UIButton *)likeBtn {
    
    if (!_likeBtn) {
        _likeBtn = [[UIButton alloc] init];
        [_likeBtn setTitle:@"赞" forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"timeline_icon_unlike"] forState:UIControlStateNormal];
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background"] forState:UIControlStateNormal];
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateHighlighted];
        [_likeBtn setTitleColor:[UIColor baseTextGrayColor] forState:UIControlStateNormal];
        [self addSubview:_likeBtn];
        _likeBtn.titleLabel.font = [UIFont baseFont];
        [_likeBtn makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.bottom.width.equalTo(self.retweetBtn);
            make.leading.equalTo(self.commentBtn.trailing);
            make.trailing.equalTo(self);
        }];
    }
    return _likeBtn;
}

- (UIButton *)commentBtn {
    
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc] init];
        [_commentBtn setTitle:@"223" forState:UIControlStateNormal];
        [_commentBtn setImage:[UIImage imageNamed:@"timeline_icon_comment"] forState:UIControlStateNormal];
        [_commentBtn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background"] forState:UIControlStateNormal];
        [_commentBtn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:_commentBtn];
        [_commentBtn setTitleColor:[UIColor baseTextGrayColor] forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = [UIFont baseFont];
        [_commentBtn makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.bottom.width.equalTo(self.retweetBtn);
            make.leading.equalTo(self.retweetBtn.trailing);
        }];
    }
    return _commentBtn;
}

- (UIButton *)retweetBtn {
    
    if (!_retweetBtn) {
        _retweetBtn = [[UIButton alloc] init];
        [_retweetBtn setTitle:@"23" forState:UIControlStateNormal];
        [_retweetBtn setImage:[UIImage imageNamed:@"timeline_icon_retweet"] forState:UIControlStateNormal];
        [_retweetBtn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background"] forState:UIControlStateNormal];
        [_retweetBtn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateHighlighted];
        [_retweetBtn setTitleColor:[UIColor baseTextGrayColor] forState:UIControlStateNormal];
        _retweetBtn.titleLabel.font = [UIFont baseFont];
        [self addSubview:_retweetBtn];
        [_retweetBtn makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.top.bottom.equalTo(self);
            make.height.equalTo(36);
        }];
    }
    return _retweetBtn;
}


@end
