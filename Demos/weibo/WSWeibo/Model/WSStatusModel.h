//
//  WSStatusModel.h
//  WSWeibo
//
//  Created by onezen on 16/6/28.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "BaseModel.h"
#import "WSUserModel.h"

@protocol WSPicUrls  @end
@interface WSPicUrls : BaseModel
@property (nonatomic, copy) NSString <Optional> *thumbnail_pic;
@property (nonatomic, copy) NSString <Optional> *bmiddle_pic;
@end


@protocol WSStatusModel  @end
@interface WSStatusModel : BaseModel
@property (nonatomic, copy) NSString <Optional> *created_at;
@property (nonatomic, strong) NSNumber <Optional> *id;
@property (nonatomic, copy) NSString <Optional> *text;
@property (nonatomic, copy) NSString <Optional> *source;
@property (nonatomic, strong) NSNumber <Optional> *reposts_count;
@property (nonatomic, strong) NSNumber <Optional> *comments_count;
@property (nonatomic, strong) NSNumber <Optional> *attitudes_count;
@property (nonatomic, strong) WSUserModel <Optional> *user;
@property (nonatomic, strong) WSStatusModel <Optional> *retweeted_status;
@property (nonatomic, strong) NSArray <Optional, WSPicUrls> *pic_urls;
@end

