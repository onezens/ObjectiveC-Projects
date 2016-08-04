//
//  WSPhotoCell.m
//  WSWeibo
//
//  Created by wackosix on 16/7/20.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSPhotoCell.h"
#import "UIImageView+WebCache.h"
#import "WSProgressView.h"

@interface WSPhotoCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) WSProgressView *progressView;

@end

@implementation WSPhotoCell


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setPlaceHolder:(UIImage *)img andImgUrl:(NSString *)url {
    
//    [self.imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:img];
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:img options:SDWebImageContinueInBackground progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        [self.contentView bringSubviewToFront:self.progressView];
        self.progressView.hidden = false;
        self.progressView.totalProgress = expectedSize;
        self.progressView.currentProgress = receivedSize;
        NSLog(@"%zd -- %zd", receivedSize, expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        NSLog(@"image download completed!!!");
        self.progressView.hidden = true;
    }];
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

- (WSProgressView *)progressView {
    
    if (!_progressView) {
        _progressView = [WSProgressView showProgressWithType:0];
        _progressView.hidden = true;
        [self.contentView addSubview:_progressView];
        _progressView.bounds = CGRectMake(0, 0, 60, 60);
        _progressView.center = self.contentView.center;
    }
    return _progressView;
}

@end
