//
//  WSOauthController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSOauthController.h"

static NSString const * Oautch = @"oauth2/authorize";
static NSString const * RegURL = @"http://m.weibo.cn/reg/index?jp=1";

typedef NS_ENUM(NSUInteger, WSOauthType) {
    WSOauthLogin,
    WSOauthRegister
};

@interface WSOauthController ()

@property (nonatomic, assign) WSOauthType oauchType;

@end

@implementation WSOauthController

+ (UINavigationController *)loginController {
    
    WSOauthController *oauchVC = [[WSOauthController alloc] init];
    oauchVC.oauchType = WSOauthLogin;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:oauchVC];
    return nav;
}
+ (UINavigationController *)registerController {
    
    WSOauthController *oauchVC = [[WSOauthController alloc] init];
    oauchVC.oauchType = WSOauthRegister;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:oauchVC];
    return nav;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [WSCoreManager markID:@"Login" label:nil];
    if (self.oauchType == WSOauthRegister) {
        self.url = RegURL;
        self.rightBarButton.hidden = true;
    }else {
        self.url = [NSString stringWithFormat:@"%@%@?client_id=%@&redirect_uri=%@",WS_API_POST, Oautch,WS_WEIBO_APPKEY, WS_WEIBO_REDIRECTURL];
    }
}

- (void)setupRootView {
    
    [super setupRootView];
    
    [self setLeftBarButtonWithText:@"取消"];
    [self setRightBarButtonWithText:@"记住密码"];
    [self.leftBarButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBarButton addTarget:self action:@selector(rememberPass) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancel {
    [self dismissLoadingView];
    [self.view endEditing:true];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)rememberPass {
    
    NSString *jsStr = @"document.getElementById('userId').value = '1551346909@qq.com'; document.getElementById('passwd').value = 'Hello world'";
    [self.webView stringByEvaluatingJavaScriptFromString:jsStr];
}

#pragma mark - webView delegate



- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [super webViewDidFinishLoad:webView];
    [self rememberPass];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *url = request.URL.absoluteString;
    WSLog(@"%@",url);
    if ([url hasPrefix:WS_WEIBO_REDIRECTURL]) {
        
        NSRange range = [url rangeOfString:@"code"];
        NSString *code = [url substringFromIndex:range.location+range.length+1];
        [WSManager.userService getAccessToken:code delegate:self];
        return false;
    }
    
    return true;
}

#pragma mark - network

- (void)requestFailedWithRes:(ResponseModel *)res{
    
    [self showLoadingViewWithText:@"网络异常"];
}

- (void)requestSuccessedWithRes:(ResponseModel *)res {
    
    [self cancel];
}





@end
