//
//  BaseTableViewCell.h
//  WSWeibo
//
//  Created by wackosix on 16/6/21.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;

@end