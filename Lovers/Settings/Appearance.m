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
    [UINavigationBar appearance].barTintColor = [UIColor greenColor];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].translucent = YES;
    
    
}

    
@end
