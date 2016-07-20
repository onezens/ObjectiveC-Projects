//
//  WSPhotoCell.m
//  WSWeibo
//
//  Created by wackosix on 16/7/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSPhotoCell.h"
#import "UIImageView+WebCache.h"

@interface WSPhotoCell ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation WSPhotoCell


- (void)setPlaceHolder:(UIImage *)img andImgUrl:(NSString *)url {
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:img];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.imgView.frame = self.bounds;
}

#pragma mark - lazy loading

- (UIImageView *)imgView {
    
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_imgView];
    }
    return _imgView;
}

@end
