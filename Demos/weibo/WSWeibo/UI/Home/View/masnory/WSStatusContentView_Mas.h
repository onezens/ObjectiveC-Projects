//
//  WSStatusContentView_Mas.h
//  WSWeibo
//
//  Created by onezen on 16/7/11.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSStatusModel;

@interface WSStatusContentView_Mas : UIView

@property (nonatomic, strong) WSStatusModel *status;

+ (instancetype)statusContentView;


@end
