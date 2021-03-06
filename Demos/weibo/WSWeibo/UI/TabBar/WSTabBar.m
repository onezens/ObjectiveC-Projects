
//
//  WSTabBar.m
//  WSWeibo
//
//  Created by onezen on 16/6/22.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSTabBar.h"
#import "WSOauthController.h"

#define itemCount 5

@interface WSTabBar ()

@property (nonatomic, strong) UIButton *centerBtn;

@end

@implementation WSTabBar

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpUI];
}

- (void)setUpUI {
    
    self.centerBtn = [[UIButton alloc] init];
    [self.centerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [self.centerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [self.centerBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [self.centerBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [self addSubview:self.centerBtn];
    [self.centerBtn sizeToFit];
    [self.centerBtn addTarget:self action:@selector(showCompose) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - layout


- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / itemCount;
    NSInteger index = 0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index==2){
                self.centerBtn.center = CGPointMake(index * width + self.centerBtn.bounds.size.width * 0.5, kTabBarHeight * 0.5);
                index++;
            }
            view.frame = CGRectMake(width * (index++), 0, width, kTabBarHeight);
        }
    }
    
}

#pragma mark - event 

- (void)showCompose {
    
    debugLog();
    [WSCoreManager markID:@"showCompose" label:nil];
    if ([WSUserModel isLogin]) {
    }else {
        UINavigationController *nav = [WSOauthController loginController];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:true completion:nil];
    }
}



@end
