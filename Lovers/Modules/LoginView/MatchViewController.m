//
//  MatchViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "MatchViewController.h"

@interface MatchViewController ()

@end

@implementation MatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createRelationButtonDo:(id)sender {
    [(AppDelegate *)[UIApplication sharedApplication].delegate changeToMainView];
}

- (IBAction)checkoutRelationButtonDo:(id)sender {
    [(AppDelegate *)[UIApplication sharedApplication].delegate changeToMainView];
}

#pragma mark - Protocol
- (BOOL)needCustomNavigation
{
    return YES;
}


@end
