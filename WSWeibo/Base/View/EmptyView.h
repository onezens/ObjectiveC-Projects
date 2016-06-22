//
//  EmptyView.h
//  WSWeibo
//
//  Created by wackosix on 16/6/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmptyView : UIView

/**是否拥有导航栏*/
@property (nonatomic, assign) BOOL isHaveNav;
/**空白视图提示内容，为空为默认提示*/
@property (nonatomic, copy) NSString *tipText;

@end
