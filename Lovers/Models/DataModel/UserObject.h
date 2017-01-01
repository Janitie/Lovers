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
    Female = 2
} GenderType;

@interface UserObject : AVUser

@property (nonatomic) NSString * iconUrl;
@property (nonatomic) GenderType gender;

@end
