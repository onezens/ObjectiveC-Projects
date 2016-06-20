//
//  BaseViewController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIButton *leftButton;

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
    
    
}


- (void)setRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage {
    
}
- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage andText:(NSString *)text {
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:normalImage forState:UIControlStateNormal];
    [leftBtn setImage:highLightImage forState:UIControlStateHighlighted];
    [leftBtn setTitle:text forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor navTintColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseThemeColor] forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    _leftButton = leftBtn;
}


- (void)setLeftBackBarButton {
    
    [self setLeftBarButtonWithImage:[[UIImage imageNamed:@"nav_backbtn_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] highLightImage:[[UIImage imageNamed:@"nav_backbtn_normal"] renderImageWithColor:[UIColor baseThemeColor]] andText:@"返回"];
    [self.leftButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLeftBarButtonWithText:(NSString *)text {
    
}


- (void)setRightBarButtonWithText:(NSString *)text {
    
}


- (void)setTwoRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage secNormal:(UIImage *)secNormalImage hightImage:(UIImage *)secHighImage textColor:(UIColor*)textColor highColor:(UIColor *)highColor {
    
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
