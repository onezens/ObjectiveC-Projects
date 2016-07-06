//
//  WSStatusContentView.m
//  WSWeibo
//
//  Created by wackosix on 16/7/6.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSStatusContentView.h"
#import "NSString+WS.h"

@interface WSStatusContentView ()

@property (nonatomic, strong) UILabel *contentView;
@property (nonatomic, strong) UICollectionView *imageView;
@property (nonatomic, strong) NSArray *imgUrls;

@end

@implementation WSStatusContentView

- (void)setContent:(NSString *)content andImageUrls:(NSArray *)imgUrls {
    
    self.contentView.text = content;
    self.imgUrls = imgUrls;
    _contentHeight = [content sizeWithFont:self.contentView.font maxSize:CGSizeMake(self.contentView.bounds.size.width, MAXFLOAT)].height + 16;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setUpUI];
}

- (void)setUpUI {
    
    self.contentView = [[UILabel alloc] init];
    self.contentView.numberOfLines = 0;
    self.contentView.font = [UIFont baseFont];
    [self addSubview:self.contentView];
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self).offset(8);
        make.bottom.trailing.equalTo(self).offset(-8);
    }];
    self.backgroundColor = self.isRetweet ? [UIColor retweetViewColor] : [UIColor whiteColor];
}

@end
