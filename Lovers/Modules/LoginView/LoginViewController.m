//
//  LoginViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "LoginViewController.h"
#import "MatchViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import "ServiceUser.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)weChatLogin:(id)sender {
    [MBProgressHUD showHUDinKeyWindow];
    
    if ([[LocalDataObject Instance] wxOpenId]) {
        [self LoginWithLocalOpenId];
        return;
    }
    
    // 微信登陆
    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeWechat
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       associateHandler(user.uid, user, user);
                                       // 微信登陆成功
                                       NSString * openId = user.uid;
                                       NSString * iconUrl = user.icon;
                                       NSString * nickName = user.nickname;
                                       NSNumber * gender = user.gender==SSDKGenderMale?@(1):@(0);
                                       
                                       // 用户尝试登陆
                                       [ServiceUser logInWithUsername:openId callback:^(UserObject *user, NSString *mCode) {
                                           if (user) {
                                               // 登陆成功
                                               [[LocalDataObject Instance] setWxOpenId:openId];
                                               [[LocalDataObject Instance] setWxIconUrl:iconUrl];
                                               [[LocalDataObject Instance] setWxNickName:nickName];
                                               [[LocalDataObject Instance] setWxGender:gender];
                                               [[LocalDataObject Instance] setUserObject:user];
                                               
                                               // 检测是否已配对
                                               [ServiceUser isMatchedWithCallback:^(BOOL succeed, Memory *currentMemo) {
                                                   [MBProgressHUD hideHUDinKeyWindow];
                                                   if (succeed) {
                                                       // 已配对，进入主页面
                                                       [[LocalDataObject Instance] setCurrentMemory:currentMemo];
                                                       [(AppDelegate *)[UIApplication sharedApplication].delegate changeToMainView];
                                                   } else {
                                                       // 未配对，进入配对页面
                                                       MatchViewController *match = [MatchViewController new];
                                                       [self.navigationController pushViewController:match animated:YES];
                                                   }
                                               }];
                                           } else {
                                               // 登陆失败，那就注册
                                               [ServiceUser signUpWithUsername:openId
                                                                      nickname:nickName
                                                                       iconUrl:iconUrl
                                                                        gender:gender
                                                                      callback:^(BOOL succeed) {
                                                                          [MBProgressHUD hideHUDinKeyWindow];
                                                                          if (succeed) {
                                                                              // 注册成功，进入配对页面
                                                                              [[LocalDataObject Instance] setWxOpenId:openId];
                                                                              [[LocalDataObject Instance] setWxIconUrl:iconUrl];
                                                                              [[LocalDataObject Instance] setWxNickName:nickName];
                                                                              [[LocalDataObject Instance] setWxGender:gender];
                                                                              
                                                                              MatchViewController *match = [MatchViewController new];
                                                                              [self.navigationController pushViewController:match animated:YES];
                                                                          } else {
                                                                              // 注册失败，不做操作
                                                                          }
                                                                      }];
                                               
                                           }
                                       }];
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    if (state == SSDKResponseStateSuccess) {
                                        
                                        
                                        
                                        
                                    } else {
                                        [MBProgressHUD hideHUDinKeyWindow];
                                    }
                                }];
    
//    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
//           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
//               if (state == SSDKResponseStateSuccess) {
//                   // 微信登陆成功
//                   NSString * openId = user.uid;
//                   NSString * iconUrl = user.icon;
//                   NSString * nickName = user.nickname;
//                   NSNumber * gender = user.gender==SSDKGenderMale?@(1):@(0);
//                   
//                   // 用户尝试登陆
//                   [ServiceUser logInWithUsername:openId callback:^(UserObject *user, NSString *mCode) {
//                       if (user) {
//                           // 登陆成功
//                           [[LocalDataObject Instance] setWxOpenId:openId];
//                           [[LocalDataObject Instance] setWxIconUrl:iconUrl];
//                           [[LocalDataObject Instance] setWxNickName:nickName];
//                           [[LocalDataObject Instance] setWxGender:gender];
//                           
//                           // 检测是否已配对
//                           [ServiceUser isMatchedWithCallback:^(BOOL succeed, Memory *currentMemo) {
//                               [MBProgressHUD hideHUDinKeyWindow];
//                               if (succeed) {
//                                   // 已配对，进入主页面
//                                   [[LocalDataObject Instance] setCurrentMemory:currentMemo];
//                                   [(AppDelegate *)[UIApplication sharedApplication].delegate changeToMainView];
//                               } else {
//                                   // 未配对，进入配对页面
//                                   MatchViewController *match = [MatchViewController new];
//                                   [self.navigationController pushViewController:match animated:YES];
//                               }
//                           }];
//                       } else {
//                           // 登陆失败，那就注册
//                           [ServiceUser signUpWithUsername:openId
//                                                  nickname:nickName
//                                                   iconUrl:iconUrl
//                                                    gender:gender
//                                                  callback:^(BOOL succeed) {
//                                                      [MBProgressHUD hideHUDinKeyWindow];
//                                                      if (succeed) {
//                                                          // 注册成功，进入配对页面
//                                                          [[LocalDataObject Instance] setWxOpenId:openId];
//                                                          [[LocalDataObject Instance] setWxIconUrl:iconUrl];
//                                                          [[LocalDataObject Instance] setWxNickName:nickName];
//                                                          [[LocalDataObject Instance] setWxGender:gender];
//                                                          
//                                                          MatchViewController *match = [MatchViewController new];
//                                                          [self.navigationController pushViewController:match animated:YES];
//                                                      } else {
//                                                          // 注册失败，不做操作
//                                                      }
//                                                  }];
//                           
//                       }
//                   }];
//                   
//                   
//                   
//               } else {
//                   [MBProgressHUD hideHUDinKeyWindow];
//               }
//           }];
}

- (void)LoginWithLocalOpenId
{
    [ServiceUser logInWithUsername:[[LocalDataObject Instance] wxOpenId] callback:^(UserObject *user, NSString *mCode) {
        // 检测是否已配对
        [ServiceUser isMatchedWithCallback:^(BOOL succeed, Memory *currentMemo) {
            [MBProgressHUD hideHUDinKeyWindow];
            if (succeed) {
                // 已配对，进入主页面
                [[LocalDataObject Instance] setCurrentMemory:currentMemo];
                [(AppDelegate *)[UIApplication sharedApplication].delegate changeToMainView];
            } else {
                // 未配对，进入配对页面
                MatchViewController *match = [MatchViewController new];
                [self.navigationController pushViewController:match animated:YES];
            }
        }];
    }];
}


#pragma mark - Protocol

- (BOOL)needCustomNavigation
{
    return YES;
}

#pragma mark - API

+ (UINavigationController *)LoginViewWithNavigation
{
    LoginViewController *loginVC = [LoginViewController new];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    return nav;
}

@end
