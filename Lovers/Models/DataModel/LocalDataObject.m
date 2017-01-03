//
//  LocalDataObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "LocalDataObject.h"

static LocalDataObject * s_instance;

@implementation LocalDataObject

- (void)setWxOpenId:(NSString *)wxOpenId
{
    [[NSUserDefaults standardUserDefaults] setObject:wxOpenId forKey:@"wxOpenId"];
}

- (NSString *)wxOpenId
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"wxOpenId"];
}

- (void)setWxNickName:(NSString *)wxNickName
{
    [[NSUserDefaults standardUserDefaults] setObject:wxNickName forKey:@"wxNickName"];
}

- (NSString *)wxNickName
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"wxNickName"];
}

- (void) setWxIconUrl:(NSString *)wxIconUrl
{
    [[NSUserDefaults standardUserDefaults] setObject:wxIconUrl forKey:@"wxIconUrl"];
}

- (NSString *)wxIconUrl
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"wxIconUrl"];
}

- (void) setWxGender:(NSNumber *)wxGender
{
    [[NSUserDefaults standardUserDefaults] setObject:wxGender forKey:@"wxGender"];
}

- (NSNumber *)wxGender
{
    return [NSNumber numberWithInteger:[[[NSUserDefaults standardUserDefaults] objectForKey:@"wxGender"] integerValue]];
}

+ (id)Instance
{
    if (!s_instance) {
        s_instance = [LocalDataObject new];
    }
    return s_instance;
}

@end
