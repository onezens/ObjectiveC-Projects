//
//  photoBrowserView.h
//  WSWeibo
//
//  Created by onezen on 16/7/14.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSStatusModel;

@interface photoBrowserView : UIView

@property (nonatomic, strong) NSArray <WSPicUrls *> *urls;
@property (nonatomic, assign, readonly) CGFloat height;

@end
