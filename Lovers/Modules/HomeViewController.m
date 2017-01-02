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

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"纪念";
    
    [self.tableView registerNib:[HomeTableViewCell cellNib] forCellReuseIdentifier:[HomeTableViewCell CellReuseIdentifier]];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;

    [ServiceUser logInWithUsername:@"user3"
                          password:DEFAULT_PASSWORD
                          callback:^(UserObject * cUser,NSString * mCode) {
                              if (cUser) {
                                  NSLog(@"good log");
                                  NSLog(@"%@",mCode);
                                  
//                                  [ServiceUser isMatchedWithCallback:^(BOOL answer) {
//                                      if (answer) {
//                                          NSLog(@"taken");
//                                      }
//                                  }];
//                                  [ServiceCheck creatNewWithTitle:@"fuck"
//                                                       finishTime:[NSDate date]
//                                                         callback:^(BOOL succeeded) {
//                                                             if (succeeded) {
//                                                                 NSLog(@"new check");
//                                                             }
//                                                         }];
//                                  [ServiceCheck deleteWithTitle:@"fuck"
//                                                       callback:^(BOOL succeeded) {
//                                                           if (succeeded) {
//                                                               NSLog(@"no fuck");
//                                                           }
//                                                       }];
                              }
                              else {
                                  NSLog(@"bad log");
                              }
                          }];
    
   
    
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

#pragma mark - TableView Delegate & DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCell CellReuseIdentifier] forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HomeTableViewCell cellHeight];
}

@end
