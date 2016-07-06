//
//  WSCoreDefs.h
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

/********************** 环境切换 **********************/
#ifdef WSWeibo_DEBUG

#define kBaseURL @"WSWeibo_DEBUG" //内测环境API接口

#define WS_API_GET          @"https://api.weibo.com/"
#define WS_API_POST         @"https://api.weibo.com/"

#else //上线环境API接口

#define kBaseURL @"WSWeibo_RELEASE"

#define WS_API_GET          @"https://api.weibo.com/"
#define WS_API_POST         @"https://api.weibo.com/"

#endif

/********************** 全局宏 **********************/

#define WS_ERROR_SYS            -1000 //ios端系统错误
#define WS_UM_APPKEY            @"576bbeffe0f55a6cb7002db7"
#define WS_TalkData_APPKEY      @"1D86C5F479F1F5B6AABA0D7385BFBDDB"
#define WS_BUGLY_APPKEY         @"900036376"
#define WS_WEIBO_APPKEY         @"2365390412"
#define WS_WEIBO_APPSEC         @"04581029a9c570f2ba0abe55967315e0"
#define WS_WEIBO_REDIRECTURL    @"http://www.wackosix.cn"

/********************** 全局头文件 **********************/
#import "WSCoreManager.h"
#import "UIColor+WS.h"
#import "UIImage+WS.h"
//#import "NSString+WS.h"
#import "BaseModel.h"
#import "BaseViewController.h"
#import "BaseService.h"
#import "MJRefresh.h"
#import "BaseTableViewCell.h"
#import "UIView+WS.h"
#import "UIFont+WS.h"
#import "WSUserModel.h"
#import "BaseLoadViewController.h"


/********************** 请求名称 **********************/

#define ReqName_GetAccessToken  @"ReqName_GetAccessToken"
#define ReqName_GetHomeStatus   @"ReqName_GetHomeStatus"

