//
//  TargetObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "TargetObject.h"

static NSString * KeyTitle = @"title";

@implementation TargetObject

+ (instancetype)Target {
    return [self objectWithClassName:TargetClass];
}

- (void)setTitle:(NSString *)title {
    [self setObject:title forKey:KeyTitle];
}

@end
