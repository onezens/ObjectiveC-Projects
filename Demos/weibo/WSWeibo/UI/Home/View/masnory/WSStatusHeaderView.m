//
//  WSHeaderView.m
//  WSWeibo
//
//  Created by onezen on 16/7/11.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSStatusHeaderView.h"
#import "UIImageView+WebCache.h"

@interface WSStatusHeaderView ()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLbl;
@property (nonatomic, weak) UILabel *timeLbl;
@property (nonatomic, weak) UILabel *fromLbl;
@property (nonatomic, weak) UIView *infoView;
@property (nonatomic, weak) UIImageView *membershipView;
@property (nonatomic, weak) UIImageView *verifiedView;

@end

@implementation WSStatusHeaderView

#pragma mark - basic


+ (instancetype)statusHeaderView {
    
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self iconView];
        [self nameLbl];
        [self timeLbl];
        [self membershipView];
        [self verifiedView];
        [self fromLbl];
    }
    return self;
}


- (void)setModel:(WSStatusModel *)model {
    
    _model = model;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.user.avatar_large] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    self.nameLbl.text = model.user.name;
    self.timeLbl.text = @"两天qian";
    self.fromLbl.text = @"iPhone";
    
}

#pragma mark - lazy loading

- (UILabel *)fromLbl {
    
    if (!_fromLbl) {
        UILabel *fromLbl = [[UILabel alloc] init];
        _fromLbl = fromLbl;
        fromLbl.font = self.timeLbl.font;
        fromLbl.textColor = self.timeLbl.textColor;
        [self.infoView addSubview:fromLbl];
        [fromLbl makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.equalTo(self.timeLbl.trailing).offset(8);
            make.top.equalTo(self.timeLbl);
        }];
    }
    return _fromLbl;
}

- (UILabel *)timeLbl {
    
    if (!_timeLbl) {
        UILabel *timeLbl = [[UILabel alloc] init];
        _timeLbl = timeLbl;
        timeLbl.font = [UIFont systemFontOfSize:13];
        timeLbl.textColor = [UIColor baseTextGrayColor];
        [self.infoView addSubview:timeLbl];
        [timeLbl makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.nameLbl);
            make.top.equalTo(self.nameLbl.bottom).offset(2);
            make.bottom.equalTo(self.infoView);
        }];
    }
    return _timeLbl;
}


- (UIImageView *)membershipView {
    
    if (!_membershipView) {
        UIImageView *membershipView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_membership"]];
        _membershipView = membershipView;
        [self.infoView addSubview:membershipView];
        [_membershipView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLbl);
            make.leading.equalTo(self.nameLbl.trailing).offset(8);
        }];
    }
    return _membershipView;
}


- (UILabel *)nameLbl {
    
    if (!_nameLbl) {
        UILabel *lbl = [[UILabel alloc] init];
        lbl.font = [UIFont baseFont];
        lbl.textColor = [UIColor baseTextColor];
        [self.infoView addSubview:lbl];
        _nameLbl = lbl;
        [lbl makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.equalTo(self.infoView);
        }];
        
    }
    return _nameLbl;
}

- (UIView *)infoView {
    
    if (!_infoView) {
        UIView *infoView = [[UIView alloc] init];
        infoView.backgroundColor = [UIColor clearColor];
        _infoView = infoView;
        [self addSubview:infoView];
        [infoView makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.iconView.trailing).offset(8);
            make.centerY.equalTo(self.iconView);
            make.trailing.equalTo(self);
        }];
    }
    return _infoView;
}

- (UIImageView *)verifiedView {
    
    if (!_verifiedView) {
        
        UIImageView *verifiedView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_vip"]];
        _verifiedView = verifiedView;
        [self addSubview:verifiedView];
        [verifiedView makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.bottom.equalTo(self.iconView);
        }];
    }
    return _verifiedView;
}

- (UIImageView *)iconView {
    
    if (!_iconView) {
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_default"]];
        _iconView = iconView;
        CGFloat width = 46.0f;
        iconView.layer.cornerRadius = width * 0.5;
        iconView.layer.masksToBounds = true;
        [self addSubview:iconView];
        [iconView makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(width);
            make.bottom.top.equalTo(self);
            make.leading.equalTo(self).offset(8);
            
        }];
    }
    return _iconView;
}

@end
