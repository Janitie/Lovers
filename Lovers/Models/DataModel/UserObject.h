//
//  UserObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

static NSString * UserClass = @"_User";

typedef enum : NSUInteger {
    Male = 1,
    Female = 0
} GenderType;

@interface UserObject : NSObject

@property (nonatomic, strong, readonly) AVUser * user;

/// wxopenid
@property (nonatomic) NSString * username;
@property (nonatomic) NSString * password;

@property (nonatomic) NSString * iconUrl;
@property (nonatomic) GenderType genderType;
@property (nonatomic) NSString * nickname;
@property (nonatomic) NSString * mCode;

+ (instancetype)newUser;
+ (instancetype)currentUser;
+ (instancetype)userWithUser:(AVUser *)user;

@end
