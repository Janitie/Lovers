//
//  CheckObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "CheckObject.h"

static NSString * KeyUser = @"user";
static NSString * KeyTitle = @"title";
static NSString * KeyTime = @"finishTime";
static NSString * KeyStatus = @"isComplete";

@implementation CheckObject

+ (instancetype)Check {
    return [self objectWithClassName:CheckClass];
}

- (void)setUser:(UserObject *)user {
    [self setObject:user forKey:KeyUser];
}

- (UserObject *)user {
    return [self objectForKey:KeyUser];
}

- (void)setTitle:(NSString *)title {
    [self setObject:title forKey:KeyTitle];
}

- (NSString *)title {
    return [self objectForKey:KeyTitle];
}

- (void)setFinishTime:(NSDate *)finishTime {
    [self setObject:finishTime forKey:KeyTime];
}

- (NSDate *)finishTime {
    return [self objectForKey:KeyTime];
}

- (void)setIsComplete:(BOOL)isComplete {
    if (isComplete == YES) {
        [self setObject:@(YES) forKey:KeyStatus];
    }
    else {
        [self setObject:@(NO) forKey:KeyStatus];
    }
}

@end
