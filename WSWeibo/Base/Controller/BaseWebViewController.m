//
//  BaseWebViewController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()



@end

@implementation BaseWebViewController

- (void)setupRootView {
    
    [super setupRootView];
    self.webView = [[UIWebView alloc] init];
    self.webView.frame = self.view.bounds;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

- (void)setUrl:(NSString *)url {
    
    _url = url;
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:req];
}



@end
