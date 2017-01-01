//
//  HomeViewController.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "ServiceUser.h"
#import "ServiceRecord.h"
#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"home";
    
    
    // 注册
    [ServiceUser signUpWithUserName:@"bolo"
                           password:@"password"
                           callback:^(BOOL succeed) {
                               if (succeed){
                                   // 跳转
                               } else {
                                   // 提示错误
                               }
                           }];
    
    // 查询纪念册内容（列表）
    [ServiceRecord fetchRecordListWithUserId:@"userId"
                                    callback:^(NSArray<RecordObject *> *objects, NSError *error) {
                                        if (!error) {
                                            // 成功
                                                                                        
                                        } else {
                                            // 失败
                                        }
                                    }];
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
