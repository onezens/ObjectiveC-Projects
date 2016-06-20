//
//  BaseViewController.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResponseModel.h"

@interface BaseViewController : UIViewController 

@property (nonatomic,strong) UIButton * leftBarButton;
@property (nonatomic,strong) UIButton * rightBarButton;
@property (nonatomic,strong) UIButton * rightSecBarButton;


- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage;

- (void)setRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage;

- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage andText:(NSString *)text;


- (void)setLeftBackBarButton;


- (void)setLeftBarButtonWithText:(NSString *)text;


- (void)setRightBarButtonWithText:(NSString *)text;

- (void)setTwoRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage secNormal:(UIImage *)secNormalImage hightImage:(UIImage *)secHighImage textColor:(UIColor*)textColor highColor:(UIColor *)highColor;


- (void)setupRootView;

- (void)goBack;

- (void)requestSuccessedWithRes:(ResponseModel *)res;


- (void)requestFailedWithRes:(ResponseModel *)res;


- (void)showLoadingView;


- (void)showLoadingViewWithText:(NSString *)text;


- (void)dismissLoadingView;


- (void)showErrorView;


- (void)dismissErrorView;


- (void)errorViewOnClick;


- (void)showToast:(NSString *)message AndImage:(UIImage *)image;


- (void)showNetErrorToast;


- (void)showOtherAlertView;


- (void)showEmptyLoadingView;

- (void)showEmptyLoadingViewWithText:(NSString *)text;


- (void)dismissEmptyLoadingView;



@end
