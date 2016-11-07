//
//  UnloginView.m
//  WSWeibo
//
//  Created by onezen on 16/6/27.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "UnloginView.h"
#import "WSOauthController.h"

@interface UnloginView ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *msgLbl;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *regBtn;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation UnloginView

+ (instancetype)unloginViewWithType:(WSUnloginViewType)type {
    
    UnloginView *view = [[UnloginView alloc] init];
    switch (type) {
        case WSUnloginViewHome:
            view.imgView.image = [UIImage imageNamed:@"visitordiscover_feed_image_house"];
            view.msgLbl.text = @"这里是未登录状态提示";
            [view regBtn];
            [view loginBtn];
            break;
        case WSUnloginViewMessage:
            
            view.imgView.image = [UIImage imageNamed:@"visitordiscover_image_message"];
            view.msgLbl.text = @"这里是未登录状态提示";
            [view regBtn];
            [view loginBtn];
            break;
        case WSUnloginViewMe:
            view.imgView.image = [UIImage imageNamed:@"visitordiscover_image_profile"];
            view.msgLbl.text = @"这里是未登录状态提示";
            [view regBtn];
            [view loginBtn];
            break;
        case WSUnloginViewDiscovery:
            
            break;
            
        default:
            break;
    }
    return view;
}

#pragma mark - event

- (void)showLogin {
    
    UINavigationController *nav = [WSOauthController loginController];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:true completion:nil];
}

- (void)showReg {
    UINavigationController *nav = [WSOauthController registerController];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:true completion:nil];
}


#pragma mark - lazy loading

- (UIView *)contentView {
    
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        [self addSubview:_contentView];
        [_contentView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.height.equalTo(250);
        }];
    }
    return _contentView;
}

- (UIImageView *)imgView {
    
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView];
        [_imgView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(94);
            make.height.equalTo(90);
            make.centerX.equalTo(self.contentView.centerX);
            make.top.equalTo(self.contentView);
        }];
    }
    return _imgView;
}

- (UILabel *)msgLbl {
    
    if (!_msgLbl) {
        _msgLbl = [[UILabel alloc] init];
        _msgLbl.text = @"这里是未登录状态提示";
        _msgLbl.font = [UIFont baseFont];
        _msgLbl.textAlignment = NSTextAlignmentCenter;
        _msgLbl.numberOfLines = 2;
        _msgLbl.textColor = [UIColor baseTextGrayColor];
        [self.contentView addSubview:_msgLbl];
        [_msgLbl makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.equalTo(224);
            make.top.equalTo(self.imgView.bottom).offset(20);
            make.centerX.equalTo(self.contentView);
        }];
    
    }
    return _msgLbl;
}

- (UIButton *)loginBtn {
    
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white"] forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_loginBtn];
        [_loginBtn addTarget:self action:@selector(showLogin) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(112);
            make.height.equalTo(36);
            make.top.equalTo(self.msgLbl.bottom).offset(20);
            make.leading.equalTo(self.regBtn.trailing).offset(16);
            
        }];
    }
    return _loginBtn;
}

- (UIButton *)regBtn {
    
    if (!_regBtn) {
        _regBtn = [[UIButton alloc] init];
        [_regBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_regBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white"] forState:UIControlStateNormal];
        [_regBtn setTitleColor:[UIColor baseThemeColor] forState:UIControlStateNormal];
        [_regBtn addTarget:self action:@selector(showReg) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_regBtn];
        [_regBtn makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.width.height.equalTo(self.loginBtn);
            make.leading.equalTo(self.contentView);
        }];
        
    }
    return _regBtn;
}

@end
