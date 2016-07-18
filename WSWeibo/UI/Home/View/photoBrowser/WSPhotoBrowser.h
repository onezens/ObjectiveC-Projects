//
//  WSPhotoBrowserController.h
//  WSWeibo
//
//  Created by wackosix on 16/7/15.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSPhotoBrowser : UIViewController

@property (nonatomic, strong) NSArray<NSString *> *thumbnail_urls;
@property (nonatomic, strong) NSArray<NSString *> *large_urls;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) UIImage *placeHolder;

@end
