//
//  WSStatusCell_Mas.h
//  WSWeibo
//
//  Created by onezen on 16/7/11.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSStatusModel;

@interface WSStatusCell_Mas : UITableViewCell

+ (instancetype)statusCellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) WSStatusModel *statusModel;

@end
