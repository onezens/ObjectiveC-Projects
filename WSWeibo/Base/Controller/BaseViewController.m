//
//  BaseViewController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseViewController.h"
#import "SVProgressHUD.h"
#import "ErrorButton.h"
#import "EmptyView.h"
#import "WSOauthController.h"
#import "UnloginView.h"

NSString * const kLoadingTitle = @"正在加载";

@interface BaseViewController ()

@property (nonatomic, strong) ErrorButton *errorBtn;
@property (nonatomic, strong) EmptyView *emptyView;
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UnloginView *unloginView;
@property (nonatomic, assign) WSUnloginViewType unloginViewType;

@end

@implementation BaseViewController

#pragma mark - init layout

- (instancetype)init {
    
    if (self = [super init]) {
        [self titleLbl];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRootView];

}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [self dismissLoadingView];
    
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.titleLbl.text = title;
    [self.titleLbl sizeToFit];
}

- (void)setupRootView {
    
    if(self.navigationController.viewControllers.count > 1){
        [self setLeftBackBarButton];
    }
    self.navigationController.navigationBar.translucent = true;
}

- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage {
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:normalImage forState:UIControlStateNormal];
    [leftBtn setImage:highLightImage forState:UIControlStateHighlighted];
    [leftBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = [UIFont navItemTitleFont];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    _leftBarButton = leftBtn;
    
}


- (void)setRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage {
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setImage:normalImage forState:UIControlStateNormal];
    [rightBtn setImage:highLightImage forState:UIControlStateHighlighted];
    [rightBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    rightBtn.titleLabel.font = [UIFont navItemTitleFont];
    [rightBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    _rightBarButton = rightBtn;
    
}
- (void)setLeftBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage andText:(NSString *)text {
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:normalImage forState:UIControlStateNormal];
    [leftBtn setImage:highLightImage forState:UIControlStateHighlighted];
    [leftBtn setTitle:text forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavTintColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = [UIFont navItemTitleFont];
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
    [leftBtn setTitleColor:[UIColor baseTitleColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = [UIFont navItemTitleFont];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    _leftBarButton = leftBtn;
}


- (void)setRightBarButtonWithText:(NSString *)text {
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setTitle:text forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor baseTitleColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor baseNavPressedTintColor] forState:UIControlStateHighlighted];
    [rightBtn sizeToFit];
    rightBtn.titleLabel.font = [UIFont navItemTitleFont];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    _rightBarButton = rightBtn;
}


- (void)setTwoRightBarButtonWithImage:(UIImage *)normalImage highLightImage:(UIImage *)highLightImage secNormal:(UIImage *)secNormalImage hightImage:(UIImage *)secHighImage textColor:(UIColor*)textColor highColor:(UIColor *)highColor {
    
    [self setRightBarButtonWithImage:normalImage highLightImage:highLightImage];
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setImage:secNormalImage forState:UIControlStateNormal];
    [rightBtn setImage:secHighImage forState:UIControlStateHighlighted];
    [rightBtn setTitleColor:textColor forState:UIControlStateNormal];
    [rightBtn setTitleColor:highColor forState:UIControlStateHighlighted];
    rightBtn.titleLabel.font = [UIFont navItemTitleFont];
    [rightBtn sizeToFit];
    _rightSecBarButton = rightBtn;
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:_rightBarButton];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:_rightSecBarButton];
    self.navigationItem.rightBarButtonItems = @[item1, item2];
}

- (void)showUnLoginViewWithType:(WSUnloginViewType)viewType {
    self.unloginViewType = viewType;
    self.unloginView.hidden = false;
}


#pragma mark - event 

- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:true];
}

- (BOOL)checkLogin {
    
    if ([WSUserModel isLogin]) {
        return true;
    }else {
        UINavigationController *nav = [WSOauthController OauthController];
        [self presentViewController:nav animated:true completion:nil];
        return false;
    }
}

#pragma mark - loading tip

- (void)showLoadingView {
    
    [SVProgressHUD showWithStatus:kLoadingTitle];
}


- (void)showLoadingViewWithText:(NSString *)text{
    
    [SVProgressHUD showWithStatus:text];
}


- (void)dismissLoadingView {
    
    [SVProgressHUD dismiss];
}

- (void)showErrorView {
    
    self.errorBtn.hidden = false;
}


- (void)dismissErrorView {
    self.errorBtn.hidden = true;
}


- (void)errorViewOnClick {
    
    [self showEmptyLoadingView];
    [self dismissErrorView];
    [self showLoadingView];
}


- (void)showOtherAlertView {
    
    
}

- (void)showEmptyLoadingView {
    
    [self showEmptyLoadingViewWithText:nil];
}

- (void)showEmptyLoadingViewWithText:(NSString *)text {
 
    self.emptyView.isHaveNav = self.navigationController;
    self.emptyView.hidden = false;
    self.emptyView.tipText = text;
}

- (void)dismissEmptyLoadingView {
    self.emptyView.hidden = true;
}

- (void)showHUD:(NSString *)message AndImage:(UIImage *)image {
    
    [SVProgressHUD showImage:image status:message];
}


- (void)showNetErrorHUD {
    [SVProgressHUD showErrorWithStatus:@"网络异常"];

}

#pragma mark - network 

- (void)requestSuccessedWithRes:(ResponseModel *)res {
    
}

- (void)requestFailedWithRes:(ResponseModel *)res {
    
}

#pragma mark - lazy loading 

- (UnloginView *)unloginView {
    
    if (!_unloginView) {
        _unloginView = [UnloginView unloginViewWithType:self.unloginViewType];
        _unloginView.frame = self.view.bounds;
        [self.view addSubview:_unloginView];
    }
    return _unloginView;
}

- (ErrorButton *)errorBtn {
    
    if(!_errorBtn){
        
        _errorBtn = [[ErrorButton alloc] init];
        _errorBtn.frame = self.view.bounds;
        [self.view addSubview:_errorBtn];
        [_errorBtn addTarget:self action:@selector(errorViewOnClick) forControlEvents:UIControlEventTouchUpInside];
//        _errorBtn.imageView.contentMode = UIViewContentModeCenter;
        
    }
    [self.view bringSubviewToFront:_errorBtn];
    return _errorBtn;
}

- (EmptyView *)emptyView {
    
    if (!_emptyView) {
        _emptyView = [[EmptyView alloc] init];
        _emptyView.frame = self.view.bounds;
        [self.view addSubview:_emptyView];
    }
    [self.view bringSubviewToFront:_emptyView];
    return _emptyView;
}

- (UILabel *)titleLbl {
    
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.font = [UIFont navTitleFont];
        _titleLbl.textColor = [UIColor baseTitleColor];
        self.navigationItem.titleView = _titleLbl;
    }
    return _titleLbl;
}


@end
