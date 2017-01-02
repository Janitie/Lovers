//
//  BaseResfreshTableViewController.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "BaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@protocol RefreshTableProtocol <NSObject>

- (void)refreshTableViewWithStartIndex: (NSInteger) startIndex finishCallBack: (void(^)())callback;

@end

@interface BaseResfreshTableViewController : BaseTableViewController <RefreshTableProtocol>

- (void) refreshHeader;
- (void) refreshFooter;

- (BOOL) needsRefreshFooter;
- (BOOL) autoRefreshHeader;

@end
