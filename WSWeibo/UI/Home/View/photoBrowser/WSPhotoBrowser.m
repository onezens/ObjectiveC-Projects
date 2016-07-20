//
//  WSPhotoBrowserController.m
//  WSWeibo
//
//  Created by wackosix on 16/7/15.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSPhotoBrowser.h"
#import "WSPhotoCell.h"

static NSString * const cellID = @"WSPhotoCell";

@interface WSPhotoBrowser ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray <UIImage *> *placeHolders;
@property (nonatomic, strong) UILabel *indexLbl;

@end

@implementation WSPhotoBrowser


+ (instancetype)showPhotoBrowser:(NSArray *)imgUrls placeHolders:(NSArray<UIImage *> *)placeHolders index:(NSInteger)index{
    
    WSPhotoBrowser *browser = [[WSPhotoBrowser alloc] init];
    browser.placeHolders = placeHolders;
    browser.large_urls = imgUrls;
    browser.currentIndex = index;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:browser animated:true completion:nil];
    return browser;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.collectionView registerClass:[WSPhotoCell class] forCellWithReuseIdentifier:cellID];
    [self setUpUI];
    
}

- (void)setUpUI {
    self.collectionView.frame = self.view.bounds;
    self.flowLayout.itemSize = self.view.bounds.size;
    if (self.currentIndex!=0) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:true];
    }
}


#pragma mark - collectionview datasource & delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WSPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell setPlaceHolder:self.placeHolders[indexPath.row] andImgUrl:self.large_urls[indexPath.item]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.large_urls.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - lazy laoding

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 0.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_flowLayout];
        _collectionView.pagingEnabled = true;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (UILabel *)indexLbl {
    
    if (!_indexLbl) {
        _indexLbl = [[UILabel alloc] init];
        [self.view addSubview:_indexLbl];
    }
    return _indexLbl;
}

- (void)dealloc {
    
    debugLog();
}

@end
