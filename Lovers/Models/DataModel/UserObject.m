//
//  UserObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "UserObject.h"

static NSString * const KeyIcon = @"iconUrl";
static NSString * const KeyGender = @"gender";

@implementation UserObject

- (void)setIconUrl:(NSString *)iconUrl {
    [self setObject:iconUrl forKey:KeyIcon];
}

- (NSString *)iconUrl {
    return [self objectForKey:KeyIcon];
}


- (void)setGender:(GenderType)gender {
    if (gender == Male) {
        [self setObject:@(1) forKey:KeyGender];
    } else {
        [self setObject:@(0) forKey:KeyGender];
    }
}

- (GenderType)gender
{
    NSNumber * genderNum = [self objectForKey:KeyGender];
    return [genderNum intValue] == 1 ? Male : Female;
}

@end
