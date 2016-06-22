//
//  BaseTableViewCell.m
//  WSWeibo
//
//  Created by wackosix on 16/6/21.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "BaseTableViewCell.h"

typedef enum : NSUInteger {
    BaseCellPositionDefault,
    BaseCellPositionTop,
    BaseCellPositionTBottom
} BaseCellPositionType;

@interface BaseTableViewCell ()

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, assign) BaseCellPositionType positonType;
@property (nonatomic, weak) NSIndexPath *indexPath;

@end

@implementation BaseTableViewCell

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat topMargin = self.positonType == BaseCellPositionTop ? 0.0 : 16.0;
    CGFloat bottomMargin = self.positonType == BaseCellPositionTBottom ? 0.0 : 16.0;
    CGFloat cellHeight = 0.5;
    self.topLine.frame = CGRectMake(topMargin, 0, self.bounds.size.width - topMargin, cellHeight);
    self.bottomLine.frame = CGRectMake(bottomMargin, self.bounds.size.height - cellHeight, self.bounds.size.width - bottomMargin, cellHeight);
    
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count {
    
    if (indexPath.row == 0) {
        self.positonType = BaseCellPositionTop;
    }else if (indexPath.row == count-1){
        self.positonType = BaseCellPositionTBottom;
    }else {
        self.positonType = BaseCellPositionDefault;
    }
}

#pragma mark - lazy loading

- (UIView *)topLine {
    
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = [UIColor baseSeperateLineColor];
        [self.contentView addSubview:_topLine];
    }
    return _topLine;
}

- (UIView *)bottomLine {
    
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor baseSeperateLineColor];
        [self.contentView addSubview:_bottomLine];
    }
    return _bottomLine;
}

@end
