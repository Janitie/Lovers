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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;

//    [ServiceUser logInWithUsername:@"user3"
//                          password:DEFAULT_PASSWORD
//                          callback:^(UserObject * cUser,NSString * mCode) {
//                              if (cUser) {
//                                  NSLog(@"good log");
//                                  NSLog(@"%@",mCode);
//                                  
//                                  [ServiceUser matchUserWithCode:@"660ee"
//                                                        callback:^(BOOL succeed, NSError *error) {
//                                                            if (succeed) {
//                                                                NSLog(@"good match");
//                                                            }
//                                                        }];
//                              }
//                              else {
//                                  NSLog(@"bad log");
//                              }
//                          }];
    
//    [ServiceUser signUpWithUsername:@"user3"
//                           nickname:@"jim"
//                            iconUrl:@"baidu"
//                           callback:^(BOOL succeeded) {
//                               if (succeeded) {
//                                   NSLog(@"good sign");
//                               }
//                           }];
    
//    [ServiceUser signUpWithUsername:@"user4"
//                           nickname:@"mary"
//                            iconUrl:@"baidu"
//                           callback:^(BOOL succeeded) {
//                               if (succeeded) {
//                                   NSLog(@"good sign2");
//                               }
//                           }];
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
