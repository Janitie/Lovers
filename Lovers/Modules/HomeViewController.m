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
                          callback:^(UserObject * user, NSString * mCode) {
                              
                              [ServiceUser isMatchedWithCallback:^(BOOL isSucceed, Memory * memoryObject) {
                                  if (isSucceed) {
                                      NSLog(@"get Memory succeed : %@", memoryObject.avObject.objectId);
                                      
                                      [ServiceRecord creatRecordWithTitle:@"catch"
                                                                  content:@"takes a lot to find cat"
                                                                   imgUrl:@"baidu"
                                                                 callback:^(BOOL succeeded) {
                                                                     if (succeeded) {
                                                                         NSLog(@"new record");
                                                                     }
                                                                 }];
                                  }
                              }];

                              
                              
                              
//                              [ServiceUser matchUserWithCode:@"660ee"
//                                                    callback:^(BOOL succeed, NSError *error) {
//                                                        if (succeed) {
//                                                            NSLog(@"matched");
//                                                        }
//                                                    }];
//                              
                          }];
    
//    [ServiceCheck findCheckWithStatus:YES
//                             callback:^(NSArray<AVObject *> *checkList, NSError *error) {
//                                 if (checkList) {
//                                     for (AVObject * check in checkList) {
//                                         CheckObject * checkie = [CheckObject objectWithObject:check];
//                                         NSLog(@"%@",checkie.title);
//                                     }
//                                 }
//                             }];
    
    
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
