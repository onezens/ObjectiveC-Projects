//
//  WSCoreDefs.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#ifdef WSWeibo_DEBUG

#define kBaseURL @"WSWeibo_DEBUG" //内测环境API接口

#define WS_API_GET          @"https://api.weibo.com/"
#define WS_API_POST         @"https://api.weibo.com/"

#else //上线环境API接口

#define kBaseURL @"WSWeibo_RELEASE"

#define WS_API_GET          @"https://api.weibo.com/"
#define WS_API_POST         @"https://api.weibo.com/"

#endif

#define WS_WEIBO_APPKEY         @"2365390412"
#define WS_WEIBO_APPSEC         @"04581029a9c570f2ba0abe55967315e0"
#define WS_WEIBO_REDIRECTURL    @"http://www.wackosix.cn"



#define WS_ERROR_SYS -1000 //ios端系统错误

