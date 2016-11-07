//
//  BaseWebViewController.h
//  WSWeibo
//
//  Created by onezen on 16/6/27.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseWebViewController : BaseViewController<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, copy) NSString *url;

- (void)webViewDidStartLoad:(UIWebView *)webView;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
- (void)webViewDidFinishLoad:(UIWebView *)webView;

@end
