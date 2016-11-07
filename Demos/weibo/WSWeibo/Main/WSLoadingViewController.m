//
//  WSLoadingViewController.m
//  WSWeibo
//
//  Created by onezen on 16/6/21.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

#import "WSLoadingViewController.h"

static NSString * const cellId = @"WSLoadingViewControllerCell";

@interface WSLoadingViewController ()

@property (nonatomic, assign) NSInteger count;

@end


@implementation WSLoadingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

#pragma mark - refresh

- (void)loadMoreData {
    
    self.count += 10;
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}

- (void)refreshData {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.count = 5;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    });
}

#pragma mark - delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell setIndexPath:indexPath count:self.count];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

@end
