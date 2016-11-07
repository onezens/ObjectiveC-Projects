//
//  WSStatusContentView.h
//  WSWeibo
//
//  Created by onezen on 16/7/6.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSStatusContentView : UIView

@property (nonatomic, assign) BOOL isRetweet;
@property (nonatomic, assign, readonly) CGFloat contentHeight;
- (void)setContent:(NSString *)content andImageUrls:(NSArray *)imgUrls;

@end
