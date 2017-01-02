//
//  CheckTableViewController.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "CheckTableViewController.h"

@interface CheckTableViewController ()

@end

@implementation CheckTableViewController

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
    self.title = @"目标";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
