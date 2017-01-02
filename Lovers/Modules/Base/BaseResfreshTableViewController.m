//
//  BaseResfreshTableViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "BaseResfreshTableViewController.h"

@interface BaseResfreshTableViewController ()

@property (nonatomic, strong) MJRefreshNormalHeader     * header;
@property (nonatomic, strong) MJRefreshBackNormalFooter * footer;

@end

@implementation BaseResfreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.mj_header = self.header;
    if ([self needsRefreshFooter]) {
        self.tableView.mj_footer = self.footer;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter
- (MJRefreshNormalHeader *)header
{
    if (!_header) {
        WS(weakSelf);
        _header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf refreshTableViewWithStartIndex:0 finishCallBack:^{
                [_header endRefreshing];
            }];
        }];
    }
    return _header;
}

- (MJRefreshBackNormalFooter *)footer
{
    if (!_footer) {
        WS(weakSelf);
        _footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf refreshTableViewWithStartIndex:[self.dataSource count] finishCallBack:^{
                [_footer endRefreshing];
            }];
        }];
    }
    return _footer;
}

#pragma mark - API
- (BOOL)autoRefreshHeader
{
    return YES;
}

- (BOOL)needsRefreshFooter
{
    return NO;
}

- (void)refreshHeader {
    [self.header beginRefreshing];
}

- (void)refreshFooter {
    [self.footer beginRefreshing];
}


- (void)refreshTableViewWithStartIndex:(NSInteger)startIndex finishCallBack:(void (^)())callback
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callback();
    });
}

@end
