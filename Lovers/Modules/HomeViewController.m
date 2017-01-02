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
#import "Memory.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (BOOL)needCustomNavigation
{
    return YES;
}

- (BOOL)needHideBottomBar
{
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"纪念";
//    
    [ServiceUser signUpWithOpenId:@"99576"
                         username:@"Jim1"
                         password:@"jim1"
                         callback:^(BOOL succeeded) {
                             if (succeeded) {
                                 NSLog(@"signup succeed");
                             }
                             else {
                                 NSLog(@"nil User");
                             }
                         }];
    
//    [UserObject logInWithUsernameInBackground:@"Jim"
//                                     password:@"jim"
//                                        block:^(AVUser * _Nullable user, NSError * _Nullable error) {
//                                            UserObject *userObj = (UserObject *)user;
//                                            userObj.gender = @(1);
//                                            [userObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//                                                if (succeeded) {
//                                                    NSLog(@"modify gender succeed");
//                                                }else {
//                                                    NSLog(@"fail modify gender , error = %@", error);
//                                                }
//                                            }];
//                                        }];
    
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
