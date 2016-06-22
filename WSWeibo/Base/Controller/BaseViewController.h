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

/**导航栏上面左边的按钮*/
@property (nonatomic,strong) UIButton * leftBarButton;
/**导航栏上面右边的按钮*/
@property (nonatomic,strong) UIButton * rightBarButton;
/**导航栏上面右边的第二个按钮*/
@property (nonatomic,strong) UIButton * rightSecBarButton;

/**
 *  设置左边的按钮的图片
 */
- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage;

/**
 *  设置右边的按钮的图片
 */
- (void)setRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage;

/**
 *  设置左边按钮的图片和标题
 */
- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage andText:(NSString *)text;

/**
 *  添加左边的返回按钮
 */
- (void)setLeftBackBarButton;

/**
 *  设置左边的返回按钮的标题
 */
- (void)setLeftBarButtonWithText:(NSString *)text;

/**
 *  设置右边返回按钮的标题
 */
- (void)setRightBarButtonWithText:(NSString *)text;

/**
 *  设置右边两个按钮的样式
 */
- (void)setTwoRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage secNormal:(UIImage *)secNormalImage hightImage:(UIImage *)secHighImage textColor:(UIColor*)textColor highColor:(UIColor *)highColor;

/**
 *  初始化设置界面
 */
- (void)setupRootView;

/**
 *  点击返回按钮
 */
- (void)goBack;

/**
 *  网络请求成功的回调方法
 */
- (void)requestSuccessedWithRes:(ResponseModel *)res;

/**
 *  网络请求失败的回调方法
 */
- (void)requestFailedWithRes:(ResponseModel *)res;

/**
 *  显示加载视图
 */
- (void)showLoadingView;

/**
 *  自定义加载的文字视图
 */
- (void)showLoadingViewWithText:(NSString *)text;

/**
 *  移除加载视图
 */
- (void)dismissLoadingView;

/**
 *  显示网络错误的view
 */
- (void)showErrorView;

/**
 *  移除网络异常的view
 */
- (void)dismissErrorView;

/**
 *  网络异常view，点击后触发的事件
 */
- (void)errorViewOnClick;

/**
 *  自定义显示HUD的提示文字和图片
 */
- (void)showHUD:(NSString *)message AndImage:(UIImage *)image;

/**
 *  显示网络异常的HUD
 */
- (void)showNetErrorHUD;


- (void)showOtherAlertView;

/**
 *  显示加载空视图
 */
- (void)showEmptyLoadingView;
/**
 *  自定义显示加载空视图的文字
 */
- (void)showEmptyLoadingViewWithText:(NSString *)text;

/**
 *  移除空视图
 */
- (void)dismissEmptyLoadingView;



@end
