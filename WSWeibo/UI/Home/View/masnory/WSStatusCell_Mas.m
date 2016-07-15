
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
@property (nonatomic, weak) UIView *selView;

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


- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.selView.frame = self.contentView.bounds;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self headerView];
        [self statusContentView];
        [self retweetStatusContentView];
        [self toolBar];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        UIView *view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor greenColor];
//        self.selView = view;
//        self.selectedBackgroundView = view;
        //添加次约束可以防止约束报错，非常重要
        [self.contentView makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.equalTo(self);
            make.bottom.equalTo(self.toolBar.bottom);
        }];
    }
    
    return self;
}


- (void)setStatusModel:(WSStatusModel *)statusModel {
    
    _statusModel = statusModel;
    self.headerView.model = statusModel;
    self.statusContentView.status = statusModel;
    self.retweetStatusContentView.status = statusModel.retweeted_status;
    
    [self layoutIfNeeded];
}

#pragma mark - lazy loading


- (WSStatusToolBarView *)toolBar {
    
    if (!_toolBar) {
        
        _toolBar = [WSStatusToolBarView toolBar];
        [self.contentView addSubview:_toolBar];
        [_toolBar makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.trailing.equalTo(self.contentView);
//            make.bottom.equalTo(self.contentView);
//            make.top.equalTo(self.retweetStatusContentView);
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
            make.top.equalTo(self.statusContentView.bottom);
            make.bottom.equalTo(self.toolBar.top);
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
            make.top.equalTo(self.headerView.bottom);
        }];
    }
    return _statusContentView;
}

- (WSStatusHeaderView *)headerView {
    
    if (!_headerView) {
        _headerView = [WSStatusHeaderView statusHeaderView];
        [self.contentView addSubview:_headerView];
        [_headerView makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(8);
        }];
    }
    return _headerView;
}


@end
