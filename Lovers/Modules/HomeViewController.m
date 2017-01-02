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

@interface HomeViewController ()

@property (nonatomic, strong) CheckObject * tempCheck;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"纪念";
    
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
//                                
//                                  WS(weakSelf);
//                                  [ServiceCheck findInCheckBoxWithTitle:@"dance"
//                                                               Callback:^(BOOL succeeded, CheckObject *checkie) {
//                                                                   if (succeeded) {
//                                                                       weakSelf.tempCheck = checkie;
//                                                                       
////                                                                       [ServiceCheck changeTitleTo:@"dance"
////                                                                                        withObject:checkie
////                                                                                          callback:^(BOOL succeeded) {
////                                                                                              if (succeeded) {
////                                                                                                  NSLog(@"lets dance");
////                                                                                              }
////                                                                                          }];
////                                                                       [ServiceCheck changeFinishTimeTo:[NSDate date]
////                                                                                             withObject:checkie
////                                                                                               callback:^(BOOL succeeded) {
////                                                                                                   if (succeeded) {
////                                                                                                       NSLog(@"new date");
////                                                                                                   }
////                                                                                               }];
//                                                                       
//                                                                   }
//                                                               }];
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

@end
