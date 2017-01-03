//
//  CheckTableViewController.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "CheckTableViewController.h"
#import "TargetTableViewCell.h"
#import "AddTargetViewController.h"
#import "ServiceCheck.h"
#import "EditRecordViewController.h"

@interface CheckTableViewController ()

@property (nonatomic, strong) UIButton * addCheckButton;

@end

@implementation CheckTableViewController

- (void)viewSetting
{
    [super viewSetting];
    
    [self.view addSubview: self.addCheckButton];
}

- (void)makeConstraints
{
    [super makeConstraints];
    
    [self.addCheckButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-TabBarHeight);
        make.height.mas_equalTo(40);
    }];
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(navHeight);
        make.bottom.mas_equalTo(self.addCheckButton.mas_top);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"目标";
    
    [self.tableView registerNib:[TargetTableViewCell cellNib]
         forCellReuseIdentifier:[TargetTableViewCell CellReuseIdentifier]];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter 
- (UIButton *)addCheckButton
{
    if (!_addCheckButton) {
        _addCheckButton = [UIButton new];
        [_addCheckButton setTitle:@"添加计划" forState:UIControlStateNormal];
        [_addCheckButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addCheckButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_addCheckButton setBackgroundColor:DEFAULT_TINT_COLOR];
        
        [_addCheckButton addTarget:self
                            action:@selector(addCheckButtonDo)
                  forControlEvents:UIControlEventTouchUpInside];
    }
    return _addCheckButton;
}

#pragma mark - Button Do
- (void)addCheckButtonDo
{
    // 添加计划
    AddTargetViewController *addTargetVC = [AddTargetViewController new];
    [self.navigationController pushViewController:addTargetVC animated:YES];
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

- (void)refreshTableViewWithStartIndex:(NSInteger)startIndex finishCallBack:(void (^)())callback
{
    [ServiceCheck findAllCheckCallback:^(NSArray<AVObject *> *checkList, NSError *error) {
        if (!error) {
            self.dataSource = checkList;
        }
        callback();
    }];
}

#pragma mark - TableView Delegate & DataSource
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TargetTableViewCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TargetTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[TargetTableViewCell CellReuseIdentifier] forIndexPath:indexPath];
    CheckObject *check = self.dataSource[indexPath.row];
    cell.isComplete = check.isComplete;
    cell.checkTitle.text = check.title;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd";
    cell.planTime.text = [formatter stringFromDate:check.finishTime];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CheckObject *check = self.dataSource[indexPath.row];
    EditRecordViewController *editRecordVC = [[EditRecordViewController alloc] initWithCheckObject:check];
    [self.navigationController pushViewController:editRecordVC animated:YES];
    
}

@end
