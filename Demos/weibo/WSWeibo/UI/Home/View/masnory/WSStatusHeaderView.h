//
//  WSHeaderView.h
//  WSWeibo
//
//  Created by onezen on 16/7/11.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSStatusModel;

@interface WSStatusHeaderView : UIView

@property (nonatomic, strong) WSStatusModel *model;

+ (instancetype)statusHeaderView;

@end
