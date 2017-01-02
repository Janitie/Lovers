//
//  SettingViewController.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "SettingViewController.h"
#import "ResumeViewController.h"
#import "MyHeaderTableViewCell.h"
#import "UserObject.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的";
    
    [self.tableView registerNib:[MyHeaderTableViewCell cellNib] forCellReuseIdentifier:[MyHeaderTableViewCell CellReuseIdentifier]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}
    
-(void)selectRightAction:(id)sender {
    ResumeViewController *resumeViewControler;
    resumeViewControler =[[ResumeViewController alloc] initWithNibName:@"ResumeViewController" bundle:nil];
    resumeViewControler.title=@"self introduction";
    [self.navigationController pushViewController:resumeViewControler animated:YES];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [MyHeaderTableViewCell cellHeight];
    } else {
        return 44.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MyHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[MyHeaderTableViewCell CellReuseIdentifier] forIndexPath:indexPath];
        UserObject * userObject = [UserObject currentUser];
        if (userObject) {
            [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:userObject.iconUrl]];
            [cell.nickNameLabel setText:userObject.nickname];
        }
        return cell;
    } else {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
        if (indexPath.row == 1) {
            [cell.textLabel setText:@"解除关系"];
        } else if (indexPath.row == 2) {
            [cell.textLabel setText:@"退出登陆"];
        }
        return cell;
    }
}


@end
