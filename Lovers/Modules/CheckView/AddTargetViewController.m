//
//  AddTargetViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "AddTargetViewController.h"
#import "AddCustomTargetViewController.h"
#import "ServiceCheck.h"

@interface AddTargetViewController ()

@property (nonatomic, strong) NSArray * targets;
@property (nonatomic, assign) NSInteger counter;

@end

@implementation AddTargetViewController

- (void)viewSetting {
    [super viewSetting];
    
    self.targetCard.layer.masksToBounds = YES;
    self.targetCard.layer.cornerRadius = 20.0f;
    self.customButton.layer.masksToBounds = YES;
    self.customButton.layer.cornerRadius = 5.0f;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加计划";
    
    [MBProgressHUD showHUDinKeyWindow];
    [ServiceCheck showTargetCallback:^(NSArray<TargetObject *> *targetList, NSError *error) {
        [MBProgressHUD hideHUDinKeyWindow];
        if (!error) {
            self.targets = targetList;
            self.counter = 0;
            [self updateTargetCard];
        }
    }];
}

- (void)updateTargetCard
{
    TargetObject *target = self.targets[self.counter];
    [self.targetTitleLabel setText:target.title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refuseButtonDo:(id)sender {
    self.counter++;
    if (self.counter >= [self.targets count]) {
        self.counter = 0;
    }
    [self updateTargetCard];
}

- (IBAction)acceptButtonDo:(id)sender {
//    self.counter++;
//    if (self.counter >= [self.targets count]) {
//        self.counter = 0;
//    }
//    [self updateTargetCard];
    
    TargetObject * target = self.targets[self.counter];
    AddCustomTargetViewController * addCusTargetVC = [[AddCustomTargetViewController alloc] initWithTargetTitle:target.title];
    [self.navigationController pushViewController:addCusTargetVC animated:YES];
}

- (IBAction)customTargetButtonDo:(id)sender {
    AddCustomTargetViewController *addCusTargetVC = [AddCustomTargetViewController new];
    [self.navigationController pushViewController:addCusTargetVC animated:YES];
}




@end
