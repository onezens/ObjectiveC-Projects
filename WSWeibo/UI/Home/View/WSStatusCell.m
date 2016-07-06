//
//  WSStatusCell.m
//  WSWeibo
//
//  Created by wackosix on 16/7/6.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSStatusCell.h"
#import "WSStatusContentView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

static NSString * const kCellID = @"WSStatusCellID";

@interface WSStatusCell ()

@property (weak, nonatomic) IBOutlet UIButton *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UIImageView *memberShipIcon;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;
@property (weak, nonatomic) IBOutlet UILabel *fromLbl;
@property (weak, nonatomic) IBOutlet WSStatusContentView *statusContent;
@property (weak, nonatomic) IBOutlet WSStatusContentView *retweetContentView;
@property (weak, nonatomic) IBOutlet UIImageView *extraIconView;
@property (weak, nonatomic) IBOutlet UIButton *retweetBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *reportBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *statusContentHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *retweetContentHeight;


@end

@implementation WSStatusCell


+ (instancetype)statusCellWithTableView:(UITableView *)tableView {
    
    WSStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"WSStatusCell" owner:nil options:nil].firstObject;
        WSLog(@"*******************");
    }
    return cell;
}

- (void)setStatusModel:(WSStatusModel *)statusModel {
    
    _statusModel = statusModel;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:statusModel.user.avatar_large] forState:UIControlStateNormal];
    self.nameLbl.text = statusModel.user.screen_name;
    [self.statusContent setContent:statusModel.text andImageUrls:statusModel.pic_urls];
    [self.retweetContentView setContent:statusModel.retweeted_status.text andImageUrls:statusModel.retweeted_status.pic_urls];
    self.statusContentHeight.constant = self.statusContent.contentHeight;
    self.retweetContentHeight.constant = self.retweetContentView.contentHeight;
    [self.contentView layoutIfNeeded];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = self.iconView.bounds.size.width * 0.5;
    self.iconView.layer.masksToBounds = true;
    self.retweetContentView.isRetweet = true;
}

@end
