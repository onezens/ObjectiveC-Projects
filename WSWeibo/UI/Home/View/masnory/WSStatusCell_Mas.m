
//
//  WSStatusCell_Mas.m
//  WSWeibo
//
//  Created by wackosix on 16/7/11.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSStatusCell_Mas.h"
#import "WSStatusContentView_Mas.h"
#import "WSStatusHeaderView.h"
#import "WSStatusToolBarView.h"

static NSString * const kCellID = @"WSStatusCell_Mas_ID";

@interface WSStatusCell_Mas ()

@property (nonatomic, weak) WSStatusContentView_Mas *statusContentView;
@property (nonatomic, weak) WSStatusContentView_Mas *retweetStatusContentView;
@property (nonatomic, weak) WSStatusHeaderView *headerView;
@property (nonatomic, weak) WSStatusToolBarView *toolBar;

@end

@implementation WSStatusCell_Mas

#pragma mark - basic

+ (instancetype)statusCellWithTableView:(UITableView *)tableView {
    
    WSStatusCell_Mas *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[WSStatusCell_Mas alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
        WSLog(@"*******************");
    }
    return cell;
}

- (instancetype)init {
    
    if (self = [super init]) {
        [self headerView];
        [self statusContentView];
        [self retweetStatusContentView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setStatusModel:(WSStatusModel *)statusModel {
    
    _statusModel = statusModel;
    self.headerView.model = statusModel;
    [self.statusContentView setContent:statusModel.text];
    [self.retweetStatusContentView setContent:statusModel.retweeted_status.text];
    [self.contentView layoutIfNeeded];
}

#pragma mark - lazy loading


- (WSStatusToolBarView *)toolBar {
    
    if (!_toolBar) {
        
        _toolBar = [WSStatusToolBarView toolBar];
        [self.contentView addSubview:_toolBar];
        [_toolBar makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.trailing.bottom.equalTo(self.contentView);
            make.top.equalTo(self.retweetStatusContentView);
        }];
    }
    return _toolBar;
}

- (WSStatusContentView_Mas *)retweetStatusContentView {
    
    if (!_retweetStatusContentView) {
        _retweetStatusContentView = [WSStatusContentView_Mas statusContentView];
        [self.contentView addSubview:_retweetStatusContentView];
        _retweetStatusContentView.backgroundColor = [UIColor retweetViewColor];
        [_retweetStatusContentView makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.trailing.equalTo(self.contentView);
            make.top.equalTo(self.statusContentView.bottom).offset(8);
            make.bottom.equalTo(self.toolBar.top).offset(-8);
        }];
    }
    return _retweetStatusContentView;
}

- (WSStatusContentView_Mas *)statusContentView {
    
    if (!_statusContentView) {
        _statusContentView = [WSStatusContentView_Mas statusContentView];
        [self.contentView addSubview:_statusContentView];
        [_statusContentView makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self.contentView);
            make.top.equalTo(self.headerView.bottom).offset(8);
        }];
    }
    return _statusContentView;
}

- (WSStatusHeaderView *)headerView {
    
    if (!_headerView) {
        _headerView = [WSStatusHeaderView statusHeaderView];
        [self.contentView addSubview:_headerView];
        [_headerView makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.trailing.equalTo(self.contentView);
        }];
    }
    return _headerView;
}


@end
