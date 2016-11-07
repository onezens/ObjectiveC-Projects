//
//  NSString+WS.h
//  WSWeibo
//
//  Created by onezen on 16/7/6.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WS)

/**
 *  url编码
 */
- (NSString *)URLEncodedString;

/**
 *  url解码
 */
- (NSString*)URLDecodedString;

/**
 *  计算字符串的大小
 *
 *  @param font    字体
 *  @param maxSize 最大的尺寸
 */
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;


@end
