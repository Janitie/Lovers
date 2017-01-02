//
//  MBProgressHUD+ShowQuickTips.h
//  MobileOA
//
//  Created by 林张宇 on 15/7/27.
//  Copyright (c) 2015年 gemo. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (ShowQuickTips)

+ (void)showQuickTipWithTitle:(NSString *)title withText:(NSString *)text;
+ (void)showHUDinKeyWindow;
+ (void)hideHUDinKeyWindow;

@end
