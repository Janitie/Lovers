//
//  MBProgressHUD+ShowQuickTips.m
//  MobileOA
//
//  Created by 林张宇 on 15/7/27.
//  Copyright (c) 2015年 gemo. All rights reserved.
//

#import "MBProgressHUD+ShowQuickTips.h"

@implementation MBProgressHUD (ShowQuickTips)

+ (void)showQuickTipWithTitle:(NSString *)title withText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window]
											  animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = text;
    [hud hide:YES afterDelay:1.5];
}

+ (void)showHUDinKeyWindow {
	if ([self HUDForView:[[UIApplication sharedApplication].delegate window] withTag:999]) { return;}

    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
	HUD.tag = 999;
}

+ (void)hideHUDinKeyWindow {
	MBProgressHUD *HUD = [self HUDForView:[[UIApplication sharedApplication].delegate window] withTag:999];
	[HUD hide:YES];
}

+ (MB_INSTANCETYPE)HUDForView:(UIView *)view withTag:(NSUInteger)tag {
	__block MBProgressHUD *HUD = nil;
	[[MBProgressHUD allHUDsForView:view] enumerateObjectsUsingBlock:^(MBProgressHUD *obj, NSUInteger idx, BOOL * _Nonnull stop) {
		if (obj.tag == tag) {
			HUD = obj;
			*stop = YES;
		}
	}];

	return HUD;
}

@end
