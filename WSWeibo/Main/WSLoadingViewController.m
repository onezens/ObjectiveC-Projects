//
//  WSLoadingViewController.m
//  WSWeibo
//
//  Created by wackosix on 16/6/21.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSLoadingViewController.h"

static NSString * const cellId = @"WSLoadingViewControllerCell";

@interface WSLoadingViewController ()

@property (nonatomic, assign) NSInteger count;

@end


@implementation WSLoadingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.count = 20;
}

#pragma mark - refresh

- (void)loadMoreData {
    
    self.count += 10;
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}

- (void)refreshData {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.count = 20;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    });
}

#pragma mark - delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

@end
