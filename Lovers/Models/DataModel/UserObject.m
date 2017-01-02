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
//static NSString * const KeyId = @"openId";
static NSString * const KeyName = @"nickname";

@interface UserObject ()

@property (nonatomic, strong) AVUser * user;

@end

@implementation UserObject

+ (instancetype) newUser
{
    UserObject *newUser = [UserObject new];
    newUser.user = [AVUser user];
    return newUser;
}

+ (instancetype) currentUser
{
    UserObject * currentUser = [UserObject new];
    currentUser.user = [AVUser currentUser];
    if (currentUser.user){
        return currentUser;
    } else {
        return NULL;
    }
}

#pragma mark - inner

- (void)setUsername:(NSString *)username
{
    self.user.username = username;
}
- (NSString *)username
{
    return self.user.username;
}

- (void)setPassword:(NSString *)password
{
    self.user.password = password;
}
- (NSString *)password
{
    return self.user.password;
}


#pragma mark - extra

- (void)setIconUrl:(NSString *)iconUrl {
    [self.user setObject:iconUrl forKey:KeyIcon];
}
- (NSString *)iconUrl {
    return [self.user objectForKey:KeyIcon];
}


- (void)setGenderType:(GenderType)gender {
    if (gender == Male) {
        [self.user setObject:@(1) forKey:KeyGender];
    } else {
        [self.user setObject:@(0) forKey:KeyGender];
    }
}
- (GenderType)genderType
{
    return [[self.user objectForKey:KeyGender] intValue] == 1 ? Male : Female;
}

//weixin Login

- (void)setNickname:(NSString *)nickname {
    [self.user setObject:nickname forKey:KeyName];
}

- (NSString *)nickname {
    return [self.user objectForKey:KeyName];
}

@end
