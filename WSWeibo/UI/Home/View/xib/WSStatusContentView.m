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

@property (nonatomic, strong) UILabel *textView;
@property (nonatomic, strong) UICollectionView *imageView;
@property (nonatomic, strong) NSArray *imgUrls;

@end

@implementation WSStatusContentView

- (void)setContent:(NSString *)content andImageUrls:(NSArray *)imgUrls {
    
    self.textView.text = content;
    self.imgUrls = imgUrls;
    _contentHeight = [content sizeWithFont:self.textView.font maxSize:CGSizeMake(kScreenWidth - 16, MAXFLOAT)].height + 16;
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
    
    self.textView = [[UILabel alloc] init];
    self.textView.numberOfLines = 0;
    self.textView.font = [UIFont baseFont];
    [self addSubview:self.textView];
    [self.textView makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self).offset(8);
        make.bottom.trailing.equalTo(self).offset(-8);
    }];
    self.backgroundColor = self.isRetweet ? [UIColor retweetViewColor] : [UIColor whiteColor];
}

@end
