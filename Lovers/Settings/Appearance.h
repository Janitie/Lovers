//
//  Appearance.h
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NAV_LINE_HEIGHT   (2/[UIScreen mainScreen].scale)
#define NAV_LINE_COLOLR  [UIColor colorWithRed:0x42/255.0 green:0x93/255.0 blue:0xE2/255.0 alpha:0.4]

#define LINE_COLOR	     [UIColor colorWithRed:0x42/255.0 green:0x93/255.0 blue:0xE2/255.0 alpha:0.4]
#define LINE_COLOR_H     [UIColor colorWithRed:0x32/255.0 green:0x9A/255.0 blue:0xF0/255.0 alpha:1]
#define LINE_COLOR_LIGHT [UIColor colorWithRed:0x32/255.0 green:0x9A/255.0 blue:0xF0/255.0 alpha:0.4]

@interface Appearance : NSObject

+ (void)defaultAppearance;

@end
