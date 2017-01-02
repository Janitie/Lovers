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

- (NSString *)className {
    return CheckClass;
}

- (void)setUser:(UserObject *)user {
    [self.avObject setObject:user forKey:KeyUser];
}

- (UserObject *)user {
    return [self.avObject objectForKey:KeyUser];
}

- (void)setTitle:(NSString *)title {
    [self.avObject setObject:title forKey:KeyTitle];
}

- (NSString *)title {
    return [self.avObject objectForKey:KeyTitle];
}

- (void)setFinishTime:(NSDate *)finishTime {
    [self.avObject setObject:finishTime forKey:KeyTime];
}

- (NSDate *)finishTime {
    return [self.avObject objectForKey:KeyTime];
}

- (void)setIsComplete:(BOOL)isComplete {
    if (isComplete == YES) {
        [self.avObject setObject:@(YES) forKey:KeyStatus];
    }
    else {
        [self.avObject setObject:@(NO) forKey:KeyStatus];
    }
}

@end
