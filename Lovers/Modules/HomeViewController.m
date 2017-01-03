//
//  HomeViewController.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "ServiceUser.h"
#import "ServiceRecord.h"
#import "ServiceCheck.h"
#import "HomeViewController.h"
#import "Memory.h"
#import "HomeTableViewCell.h"
#import "MemoryDetailViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) CheckObject * tempCheck;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"纪念";
    
    [self.tableView registerNib:[HomeTableViewCell cellNib] forCellReuseIdentifier:[HomeTableViewCell CellReuseIdentifier]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Protocol
- (BOOL)needCustomNavigation
{
    return YES;
}

- (BOOL)needHideBottomBar
{
    return NO;
}

- (BOOL)needsRefreshFooter
{
    return YES;
}

- (void)refreshTableViewWithStartIndex:(NSInteger)startIndex finishCallBack:(void (^)())callback
{
    WS(weakSelf);
    [ServiceRecord fetchRecordListWithSkip:startIndex callback:^(NSArray<RecordObject *> *objects, NSError *error) {
        if (!error) {
            if (startIndex == 0) {
                weakSelf.dataSource = objects;
            } else {
                NSMutableArray * newArray = [NSMutableArray arrayWithArray:weakSelf.dataSource];
                [newArray addObjectsFromArray:objects];
                weakSelf.dataSource = newArray;
            }
        }
        callback();
    }];
}

#pragma mark - TableView Delegate & DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCell CellReuseIdentifier] forIndexPath:indexPath];
    RecordObject *record = self.dataSource[indexPath.row];
    
    [cell.posterImg sd_setImageWithURL:[NSURL URLWithString:record.imgUrl]];
    [cell.recordTitle setText:record.title];
    [cell.achieveTime setText:record.createAt];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RecordObject *record = self.dataSource[indexPath.row];
    MemoryDetailViewController * detailVC = [MemoryDetailViewController new];
    detailVC.record = record;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HomeTableViewCell cellHeight];
}

@end
