//
//  WSPhotoBrowserController.m
//  WSWeibo
//
//  Created by onezen on 16/7/15.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSPhotoBrowser.h"
#import "WSPhotoCell.h"

static NSString * const cellID = @"WSPhotoCell";

@interface WSPhotoBrowser ()<UICollectionViewDelegate, UICollectionViewDataSource, UIActionSheetDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray <UIImage *> *placeHolders;
@property (nonatomic, strong) UILabel *indexLbl;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, assign) NSInteger index;

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
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor blackColor];
    self.collectionView.frame = self.view.bounds;
    self.flowLayout.itemSize = self.view.bounds.size;
    if (self.currentIndex!=0) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:true];
    }
    self.indexLbl.f_centerX = self.view.f_centerX;
    self.indexLbl.f_top = 30;
    [self moreBtn];
}


- (void)setIndex:(NSInteger)index {
    
    _index = index;
    if (self.large_urls.count==1) {
        self.indexLbl.hidden = true;
        return;
    }
    self.indexLbl.hidden = false;
    self.indexLbl.text = [NSString stringWithFormat:@"%zd/%zd",index+1, self.large_urls.count];
    [self.indexLbl sizeToFit];
}

#pragma mark - collectionview datasource & delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WSPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell setPlaceHolder:self.placeHolders[indexPath.row] andImgUrl:self.large_urls[indexPath.item]];
    [self setIndex:indexPath.item];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.large_urls.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - event

- (void)moreBtnClick {
    
    debugLog();
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"保存照片", @"其它", nil];
    [sheet showInView:self.view];
}

- (void)saveImageToAblum {
    
    WSPhotoCell *cell = (WSPhotoCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.index inSection:0]];
    UIImage *image = [cell cellImage];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

// 存储图片回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        NSLog(@"save image success");
    }
}


#pragma mark - actionSheet delegate 

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"%zd", buttonIndex);
    if (buttonIndex == 0) {
        [self saveImageToAblum];
    }
}



#pragma mark - lazy laoding

- (UIButton *)moreBtn {
    
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc] init];
        [_moreBtn setImage:[UIImage imageNamed:@"image_more"] forState:UIControlStateNormal];
        [_moreBtn setImage:[UIImage imageNamed:@"image_more_highlighted"] forState:UIControlStateHighlighted];
        [_moreBtn setImage:[UIImage imageNamed:@"image_more_disable"] forState:UIControlStateDisabled];
        [_moreBtn sizeToFit];
        _moreBtn.center = CGPointMake(self.view.bounds.size.width - _moreBtn.bounds.size.width - 16, self.indexLbl.center.y);
        [_moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_moreBtn];
    }
    return _moreBtn;
}

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
        _indexLbl.textColor = [UIColor whiteColor];
        _indexLbl.font = [UIFont boldSystemFontOfSize:17];
        [self.view addSubview:_indexLbl];
    }
    return _indexLbl;
}

- (void)dealloc {
    
    debugLog();
}

@end
