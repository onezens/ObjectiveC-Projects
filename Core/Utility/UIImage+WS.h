//
//  UIImage+WS.h
//  WSWeibo
//
//  Created by onezen on 16/6/20.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WS)

/**
 *  给图片添加填充颜色
 *
 *  @param color 填充的颜色
 *
 *  @return 填充过颜色后的图片
 */
- (instancetype)renderImageWithColor:(UIColor *)color;

/**
 *  等比压缩图片
 *
 *  @param width 最大的宽或者高
 */
- (instancetype)compressImageWithMaxWidth:(CGFloat)width;

@end
