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


//NSArray * checkArray = [NSArray arrayWithObjects:@"go fly",@"go out midnight",@"drink wine",
//                        @"play hide",@"play game6",@"sing a song", nil];6
//
//NSArray * checkArray = [NSArray arrayWithObjects:@"go climb",@"go out evening",@"eat rice",
//                        @"play laptop",@"play game5",@"speak spanish", nil];4
//
//NSArray * checkArray = [NSArray arrayWithObjects:@"go jump",@"go out afternoon",@"eat bread",
//                        @"play ball",@"play game4",@"speak english", nil];3
//
//NSArray * checkArray = [NSArray arrayWithObjects:@"go dive",@"go out morning",@"eat paper",
//                        @"play vollyball",@"play game3",@"speak chinese", nil];2
//
//NSArray * checkArray = [NSArray arrayWithObjects:@"go hiking",@"go out night",@"eat crab",
//                        @"play baseball",@"play game2",@"cry out loud", nil];   1
//
//NSArray * checkArray = [NSArray arrayWithObjects:@"go swim",@"go hunt",@"eat dinner",
//                        @"play football",@"play game",@"laugh out loud", nil];5
