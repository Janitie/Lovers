//
//  LoginViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "LoginViewController.h"
#import "MatchViewController.h"

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

    MatchViewController *match = [MatchViewController new];
    [self.navigationController pushViewController:match animated:YES];
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
