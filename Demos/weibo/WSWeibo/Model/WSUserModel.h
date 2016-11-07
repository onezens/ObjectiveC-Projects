//
//  WSUserModel.h
//  WSWeibo
//
//  Created by onezen on 16/6/27.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "BaseModel.h"

@interface WSUserModel : BaseModel

//user = {
//    cover_image_phone = http://ww4.sinaimg.cn/crop.0.0.640.640.640/6ce2240djw1e8iktk4ohij20hs0hsmz6.jpg
//    id = 2794665971;
//    bi_followers_count = 434;
//    urank = 37;
//    profile_image_url = http://tva2.sinaimg.cn/crop.0.0.399.399.50/a69337f3tw1ebicjkgixnj20b40b4gmc.jpg
//    class = 1;
//    verified_contact_email = ;
//    province = 14;
//    ability_tags = 搞笑,三俗,幽默艺术,时尚设计,烹饪,影评,减肥,亲子教育,新闻趣事,段子手;
//    verified = 1;
//    url = http://weibo.com/234527658;
//    statuses_count = 4949;
//    geo_enabled = 0;
//    follow_me = 0;
//    description = 用亲手制作的GIF图，带大家一起涨姿势，会心一笑！;
//    followers_count = 2179844;
//    verified_contact_mobile = ;
//    location = 山西 临汾;
//    mbrank = 6;
//    avatar_large = http://tva2.sinaimg.cn/crop.0.0.399.399.180/a69337f3tw1ebicjkgixnj20b40b4gmc.jpg;
//    star = 0;
//    verified_trade = 3370;
//    profile_url = 517823486;
//    cover_image = http://ww4.sinaimg.cn/crop.0.0.980.300/a69337f3tw1e884r1f61oj20r808cq2r.jpg;
//    weihao = 517823486;
//    online_status = 0;
//    verified_contact_name = ;
//    screen_name = 好奇博士;
//    verified_source_url = ;
//    pagefriends_count = 2;
//    name = 好奇博士;
//    verified_reason = 微博知名科普趣味GIF作图者;
//    friends_count = 500;
//    mbtype = 12;
//    block_app = 1;
//    avatar_hd = http://tva2.sinaimg.cn/crop.0.0.399.399.1024/a69337f3tw1ebicjkgixnj20b40b4gmc.jpg;
//    credit_score = 80;
//    remark = ;
//    created_at = Wed Jul 18 01:53:18 +0800 2012;
//    block_word = 0;
//    allow_all_act_msg = 0;
//    verified_state = 0;
//    domain = ;
//    verified_reason_modified = ;
//    allow_all_comment = 1;
//    verified_level = 3;
//    verified_reason_url = ;
//    gender = m;
//    favourites_count = 21;
//    idstr = 2794665971;
//    verified_type = 0;
//    city = 10;
//    verified_source = ;
//    verified_type_ext = 0;
//    user_ability = 12;
//    lang = zh-cn;
//    ptype = 0;
//    following = 1;
//}

@property (nonatomic, copy) NSString <Optional> *uid;
@property (nonatomic, copy) NSString <Optional> *name;
@property (nonatomic, copy) NSNumber <Optional> *verified;
@property (nonatomic, copy) NSNumber <Optional> *bi_followers_count;
@property (nonatomic, copy) NSNumber <Optional> *statuses_count;
@property (nonatomic, copy) NSNumber <Optional> *friends_count;
@property (nonatomic, copy) NSString <Optional> *screen_name;
@property (nonatomic, copy) NSString <Optional> *access_token;
@property (nonatomic, copy) NSString <Optional> *cover_image_phone;
@property (nonatomic, copy) NSString <Optional> *avatar_hd;
@property (nonatomic, copy) NSString <Optional> *avatar_large;
@property (nonatomic, copy) NSString <Optional> *profile_image_url;
@property (nonatomic, copy) NSString <Optional> *verified_reason;
@property (nonatomic, copy) NSString <Optional> *location;

+ (instancetype)currentUser;
+ (BOOL)isLogin;
+ (void)logout;

@end
