//
//  photoBrowserView.h
//  WSWeibo
//
//  Created by wackosix on 16/7/14.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSStatusModel;

@interface photoBrowserView : UIView

@property (nonatomic, strong) NSArray <WSPicUrls *> *urls;
@property (nonatomic, assign, readonly) CGFloat height;

@end
