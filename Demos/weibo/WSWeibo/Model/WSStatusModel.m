//
//  WSStatusModel.m
//  WSWeibo
//
//  Created by onezen on 16/6/28.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSStatusModel.h"

@implementation WSPicUrls

- (NSString<Optional> *)bmiddle_pic {
    
    return [self.thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
}

@end

@implementation WSStatusModel @end
