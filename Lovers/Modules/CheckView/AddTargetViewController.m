//
//  AddTargetViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "AddTargetViewController.h"
#import "AddCustomTargetViewController.h"

@interface AddTargetViewController ()

@end

@implementation AddTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加计划";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refuseButtonDo:(id)sender {
}

- (IBAction)acceptButtonDo:(id)sender {
}

- (IBAction)customTargetButtonDo:(id)sender {
    AddCustomTargetViewController *addCusTargetVC = [AddCustomTargetViewController new];
    [self.navigationController pushViewController:addCusTargetVC animated:YES];
}




@end
