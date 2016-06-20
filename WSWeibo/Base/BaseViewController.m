//
//  BaseViewController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

#pragma mark - init layout

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupRootView];
}

- (void)setupRootView {
    
    [self setLeftBackBarButton];
    self.navigationController.navigationBar.translucent = true;
}

- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage {
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setImage:normalImage forState:UIControlStateNormal];
    [rightBtn setImage:highLightImage forState:UIControlStateHighlighted];
    [rightBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightBtn sizeToFit];
    _rightBarButton = rightBtn;
    
}


- (void)setRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage {
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:normalImage forState:UIControlStateNormal];
    [leftBtn setImage:highLightImage forState:UIControlStateHighlighted];
    [leftBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [leftBtn sizeToFit];
    _leftBarButton = leftBtn;
    
}
- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage andText:(NSString *)text {
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:normalImage forState:UIControlStateNormal];
    [leftBtn setImage:highLightImage forState:UIControlStateHighlighted];
    [leftBtn setTitle:text forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    _leftBarButton = leftBtn;
}


- (void)setLeftBackBarButton {
    
    [self setLeftBarButtonWithImage:[[UIImage imageNamed:@"nav_backbtn_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] highLightImage:[[UIImage imageNamed:@"nav_backbtn_normal"] renderImageWithColor:[UIColor baseNavPressedTintColor]] andText:@"返回"];
    [self.leftBarButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLeftBarButtonWithText:(NSString *)text {
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setTitle:text forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    _leftBarButton = leftBtn;
}


- (void)setRightBarButtonWithText:(NSString *)text {
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setTitle:text forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    _rightBarButton = rightBtn;
}


- (void)setTwoRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage secNormal:(UIImage *)secNormalImage hightImage:(UIImage *)secHighImage textColor:(UIColor*)textColor highColor:(UIColor *)highColor {
    
    [self setRightBarButtonWithImage:normalImage highLightImage:highLightImage];
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setImage:secNormalImage forState:UIControlStateNormal];
    [rightBtn setImage:secHighImage forState:UIControlStateHighlighted];
    [rightBtn setTitleColor:textColor forState:UIControlStateNormal];
    [rightBtn setTitleColor:highColor forState:UIControlStateHighlighted];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightBtn sizeToFit];
    _rightSecBarButton = rightBtn;
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:_rightBarButton];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:_rightSecBarButton];
    self.navigationItem.rightBarButtonItems = @[item1, item2];
}


#pragma mark - event 

- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - loading tip

- (void)showLoadingView {
    
}


- (void)showLoadingViewWithText:(NSString *)text{
    
}


- (void)dismissLoadingView {
    
}

- (void)showErrorView {
    
}


- (void)dismissErrorView {
    
}


- (void)errorViewOnClick {
    
}


- (void)showOtherAlertView {
    
}

- (void)showEmptyLoadingView {
    
}

- (void)showEmptyLoadingViewWithText:(NSString *)text {
    
}

- (void)dismissEmptyLoadingView {
    
}

- (void)showToast:(NSString *)message AndImage:(UIImage *)image {
    
}


- (void)showNetErrorToast {
    
}

#pragma mark - network 

- (void)requestSuccessedWithRes:(ResponseModel *)res {
    
}

- (void)requestFailedWithRes:(ResponseModel *)res {
    
}



@end
