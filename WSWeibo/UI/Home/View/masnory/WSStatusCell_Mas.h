//
//  WSStatusCell_Mas.h
//  WSWeibo
//
//  Created by wackosix on 16/7/11.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSStatusModel;

@interface WSStatusCell_Mas : UITableViewCell

+ (instancetype)statusCellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) WSStatusModel *statusModel;

@end
