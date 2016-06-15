//
//  WSCoreDefs.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#ifdef WSWeibo_DEBUG

#define kBaseURL @"WSWeibo_DEBUG" //内测环境API接口

#define WS_API_GET          @""
#define WS_API_POST         @""

#else //上线环境API接口

#define kBaseURL @"WSWeibo_RELEASE"


#endif


#define WS_ERROR_SYS -1000 //ios端系统错误
