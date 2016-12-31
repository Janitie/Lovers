//
//  SettingViewController.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "SettingViewController.h"
#import "ResumeViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self action:@selector(selectRightAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;

}
    
-(void)selectRightAction:(id)sender {
    ResumeViewController *resumeViewControler;
    resumeViewControler =[[ResumeViewController alloc] initWithNibName:@"ResumeViewController" bundle:nil];
    resumeViewControler.title=@"self introduction";
    [self.navigationController pushViewController:resumeViewControler animated:YES];
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
