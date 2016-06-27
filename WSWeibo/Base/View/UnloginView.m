//
//  UnloginView.m
//  WSWeibo
//
//  Created by wackosix on 16/6/27.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "UnloginView.h"

@interface UnloginView ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *msgLbl;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *regBtn;

@end

@implementation UnloginView

- (void)setImage:(UIImage *)image {
    
    self.imgView.image = image;
}

@end
