//
//  MatchViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "MatchViewController.h"
#import "ServiceUser.h"
#import "UserObject.h"

@interface MatchViewController ()

@end

@implementation MatchViewController

- (void)viewSetting {
    [super viewSetting];
    
    self.myMCodeTextField.text = [[LocalDataObject Instance] userObject].mCode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createRelationButtonDo:(id)sender {
    [MBProgressHUD showHUDinKeyWindow];
    [ServiceUser matchUserWithCode:self.othersCodeTextField.text
     callback:^(BOOL succeed, Memory *memory, NSError *error) {
         [MBProgressHUD showHUDinKeyWindow];
         if (succeed) {
             [[LocalDataObject Instance] setCurrentMemory:memory];
             [(AppDelegate *)[UIApplication sharedApplication].delegate changeToMainView];
         }
     }];
}

- (IBAction)checkoutRelationButtonDo:(id)sender {
    [MBProgressHUD showHUDinKeyWindow];
    [ServiceUser isMatchedWithCallback:^(BOOL succeed, Memory *currentMemo) {
        [MBProgressHUD hideHUDinKeyWindow];
        if (succeed) {
            [[LocalDataObject Instance] setCurrentMemory:currentMemo];
            [(AppDelegate *)[UIApplication sharedApplication].delegate changeToMainView];
        }
    }];
}

#pragma mark - Protocol
- (BOOL)needCustomNavigation
{
    return YES;
}


@end
