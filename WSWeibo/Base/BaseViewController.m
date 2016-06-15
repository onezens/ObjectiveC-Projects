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
    
}

- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage {
    
}


- (void)setRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage {
    
}
- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage andText:(NSString *)text {
    
}


- (void)setLeftBackBarButton {
    
}

- (void)setLeftBarButtonWithText:(NSString *)text {
    
}


- (void)setRightBarButtonWithText:(NSString *)text {
    
}


- (void)setTwoRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage secNormal:(UIImage *)secNormalImage hightImage:(UIImage *)secHighImage textColor:(UIColor*)textColor highColor:(UIColor *)highColor {
    
}


#pragma mark - event 

- (void)goBack {
    
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
