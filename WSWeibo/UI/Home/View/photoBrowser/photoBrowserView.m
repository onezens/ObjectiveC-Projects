//
//  photoBrowserView.m
//  WSWeibo
//
//  Created by wackosix on 16/7/14.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "photoBrowserView.h"
#import "UIImageView+WebCache.h"

#define MaxImagesCount 9

@interface photoBrowserView ()

@property (nonatomic, strong) NSMutableArray<UIImageView *> *imgViews;
@property (nonatomic, strong) NSMutableArray<UIImageView *> *showViews;

@end

@implementation photoBrowserView


- (void)setUrls:(NSArray<WSPicUrls *> *)urls {
    
    _urls = urls;
    [self addViewCount:urls.count];
    [self updateLayout];
    
}

- (void)updateLayout {
    
    CGFloat borderMargin = 8;
    CGFloat cellMargin = 8;
    
    CGFloat width = (kScreenWidth - 2*borderMargin - 2*cellMargin)/3;
    NSInteger count = self.showViews.count;
    for (NSInteger i=0; i<count; i++) {
        NSInteger row = i / 3;
        NSInteger column = i % 3;
        UIImageView *imgView = self.imgViews[i];
        imgView.frame = CGRectMake(borderMargin + (width + cellMargin)*column, borderMargin + (width + cellMargin)*row, width, width);
    }
    
    NSInteger row = count==0 ? 0 : ((count-1) / 3)+1;
    self.f_height = row==0 ? 0 : width*row + cellMargin*(row-1) + borderMargin;
    _height = self.f_height;
}



- (void)addViewCount:(NSInteger)count {
    
    [self.showViews removeAllObjects];
    [self.imgViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if (count > idx) {
            obj.hidden = false;
            [obj sd_setImageWithURL:[NSURL URLWithString:self.urls[idx].bmiddle_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
            [self.showViews addObject:obj];
        }else {
            obj.hidden = true;
        }
    }];
}


#pragma mark - lazy loading

- (NSMutableArray<UIImageView *> *)imgViews {
    
    if (!_imgViews) {
        
        _imgViews = [NSMutableArray arrayWithCapacity:MaxImagesCount];
        for (NSInteger i=0; i<MaxImagesCount; i++) {
            UIImageView *img = [[UIImageView alloc] init];
            img.contentMode = UIViewContentModeScaleAspectFill;
            img.clipsToBounds = true;
            [_imgViews addObject:img];
            [self addSubview:img];
        }
        
    }
    return _imgViews;
}

- (NSMutableArray<UIImageView *> *)showViews {
    
    if (!_showViews) {
        _showViews = [NSMutableArray arrayWithCapacity:9];
    }
    return _showViews;
}

@end
