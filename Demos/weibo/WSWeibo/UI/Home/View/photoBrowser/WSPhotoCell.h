//
//  WSPhotoCell.h
//  WSWeibo
//
//  Created by onezen on 16/7/20.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSPhotoCell : UICollectionViewCell

- (UIImage *)cellImage;
- (void)setPlaceHolder:(UIImage *)img andImgUrl:(NSString *)url;

@end
