//
//  Appearance.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "Appearance.h"

@implementation Appearance

+ (void)defaultAppearance {
    UIApplication *app = [UIApplication sharedApplication];
    
    app.statusBarStyle = UIStatusBarStyleDefault;
    app.statusBarHidden = NO;
    
    //设置顶栏
    [UINavigationBar appearance].backgroundColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = DEFAULT_THEME;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
    [UINavigationBar appearance].translucent = YES;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]}
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:DEFAULT_TINT_COLOR}
                                             forState:UIControlStateSelected];
    [[UITabBar appearance] setTintColor:DEFAULT_TINT_COLOR];
}

    
@end
