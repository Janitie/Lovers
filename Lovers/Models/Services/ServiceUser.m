//
//  ServiceUser.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "ServiceUser.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation ServiceUser


+ (void)signUpWithUsername:(NSString *)username nickname:(NSString *)nickname iconUrl:(NSString *)iconUrl callback:(void (^)(BOOL))callback
{
    if (username && nickname && iconUrl) {
        UserObject * newUser = [UserObject newUser];
        newUser.username = username;
        newUser.password = DEFAULT_PASSWORD;
        newUser.iconUrl = iconUrl;
        newUser.genderType = Male;
        
        [newUser.user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (!error) {
                if (callback) {
                    callback(succeeded);
                }
            }
        }];
    }
}

+ (void)logInWithUsername:(NSString *)username
                 password:(NSString *)password
                 callback:(void (^)(UserObject *))callback {
    if (username && password) {
        [AVUser logInWithUsernameInBackground:username
                                     password:password
                                        block:^(AVUser * _Nullable user, NSError * _Nullable error) {
                                            if (user) {
                                                UserObject * logUser = [UserObject currentUser];
                                                callback(logUser);
                                            }
                                            else {
                                                callback(nil);
                                            }
                                        }];
    }
}

@end
