//
//  BaseTableViewController.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) UITableView * tableView;

@property (nonatomic, copy) NSArray * dataSource;

@end
