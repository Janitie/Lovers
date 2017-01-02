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

- (NSString *)className {
    return TargetClass;
}

- (void)setTitle:(NSString *)title {
    [self.avObject setObject:title forKey:KeyTitle];
}

- (NSString *)title
{
    return [self.avObject objectForKey:KeyTitle];
}

@end
