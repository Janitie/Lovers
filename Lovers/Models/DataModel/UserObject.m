//
//  UserObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "UserObject.h"

static NSString * const KeyName = @"nickname";
static NSString * const KeyId = @"userId";
static NSString * const KeyIcon = @"iconUrl";
static NSString * const KeyGender = @"gender";

@implementation UserObject

+ (instancetype)User {
    return [super objectWithClassName:UserClass];
}


- (void)setName:(NSString *)nickname
{
    [self setObject:nickname forKey:KeyName];
}

- (NSString *)nickname
{
    return [self objectForKey:KeyName];
}

@end
