//
//  MatchObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "MatchObject.h"

static NSString * KeyUserOne = @"userOne";
static NSString * KeyUserTwo = @"userTwo";
static NSString * KeyMemory = @"memory";

@implementation MatchObject

- (NSString *) className
{
    return MatchClassName;
}

- (void)setMemory:(AVObject *)memory {
    [self.avObject setObject:memory forKey:KeyMemory];
}

- (AVObject *)memory {
    return [self.avObject objectForKey:KeyMemory];
}

- (void)setUserOne:(AVObject *)userOne
{
    [self.avObject setObject:userOne forKey:KeyUserOne];
}

- (AVObject *)userOne
{
    return [self.avObject objectForKey:KeyUserOne];
}

- (void)setUserTwo:(AVObject *)userTwo
{
    [self.avObject setObject:userTwo forKey:KeyUserTwo];
}

- (AVObject *)userTwo
{
    return [self.avObject objectForKey:KeyUserTwo];
}

@end
