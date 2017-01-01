//
//  UserObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

static NSString * UserClass = @"_User";

typedef enum gender{
    male = 1,
    female
}genderType;

@interface UserObject : AVObject

@property (nonatomic) NSString * nickname;
@property (nonatomic) AVUser * userId;
@property (nonatomic) NSString * iconUrl;
@property (nonatomic) genderType * gender;

+ (instancetype) User;

@end
