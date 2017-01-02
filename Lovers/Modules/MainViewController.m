//
//  MainViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self setupTabViews];
    }
    return self;
}

- (void)setupTabViews {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"纪念"
                                                                  image:[self imageNamed:@"ic_memory_n"]
                                                                    tag:0];
    UINavigationController *naviHome = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    //    [tabbarController addChildViewController:naviHome];
    
    CheckTableViewController *checkTableViewController = [[CheckTableViewController alloc] init];
    checkTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"目标"
                                                                        image:[self imageNamed:@"ic_target_n"]
                                                                          tag:1];
    UINavigationController * naviCheck = [[UINavigationController alloc] initWithRootViewController:checkTableViewController];
    //    [tabbarController addChildViewController:naviCheck];
    
    SettingViewController *settingTableViewController = [[SettingViewController alloc] init];
    settingTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                                          image:[self imageNamed:@"ic_mine_n"]
                                                                            tag:2];
    UINavigationController *naviSet = [[UINavigationController alloc] initWithRootViewController:settingTableViewController];
    //    [tabbarController addChildViewController:naviSet];
    
    self.viewControllers =  @[naviHome,
                              naviCheck,
                              naviSet];
    
    
}

- (UIImage *)imageNamed:(NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAutomatic];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
