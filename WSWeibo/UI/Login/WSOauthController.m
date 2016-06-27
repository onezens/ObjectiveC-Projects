//
//  WSOauthController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSOauthController.h"

NSString const * Oautch = @"oauth2/authorize";

@interface WSOauthController ()

@end

@implementation WSOauthController

+ (UINavigationController *)OauthController {
    
    WSOauthController *oauchVC = [[WSOauthController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:oauchVC];
    return nav;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [WSCoreManager markID:@"Login" label:nil];
    self.url = [NSString stringWithFormat:@"%@%@?client_id=%@&redirect_uri=%@",WS_API_POST, Oautch,WS_WEIBO_APPKEY, WS_WEIBO_REDIRECTURL];
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

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [self showLoadingView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self dismissLoadingView];
    [self rememberPass];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *url = request.URL.absoluteString;
    
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
