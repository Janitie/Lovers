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
                NSString *mcode = [newUser.user objectId];
                NSLog(@"%@",mcode);
                mcode = [mcode substringFromIndex:mcode.length-5];
                newUser.mCode = mcode;
                
                [newUser.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                    if (callback) {
                        callback(succeeded);
                    }
                }];
                
            }
        }];
        
    }
}

+ (void)logInWithUsername:(NSString *)username
                 password:(NSString *)password
                 callback:(void (^)(UserObject *,NSString *))callback {
    if (username && password) {
        [AVUser logInWithUsernameInBackground:username
                                     password:password
                                        block:^(AVUser * _Nullable user, NSError * _Nullable error) {
                                            if (user) {
                                                UserObject * logUser = [UserObject currentUser];
                                                callback(logUser, logUser.mCode);
                                            }
                                            else {
                                                callback(nil, nil);
                                            }
                                        }];
    }
}

+ (void)exit {
    if ([UserObject currentUser]) {
        [AVUser logOut];
    }
    else {
        NSLog(@"error logout");
    }
}


+ (void)matchUserWithCode:(NSString *)mCode callback:(void (^)(BOOL, NSError *))callback {
    AVQuery *query = [AVUser query];
    [query whereKey:@"matchCode" equalTo:mCode];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects && objects.count > 0) {
            UserObject *user = [UserObject userWithUser:objects[0]];
            UserObject * me = [UserObject currentUser];
            
            MatchObject *match = [MatchObject newObject];
            match.userOne = user.user;
            match.userTwo = me.user;
            
            [match.avObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                [AVObject saveAllInBackground:@[user.user, me.user]
                                        block:^(BOOL succeeded, NSError * _Nullable error) {
                                            if (callback) {
                                                callback(succeeded, error);
                                            }
                                        }];
            }];
        } else {
            callback(NO, nil);
            NSLog(@"no object");
        }
    }];
}


+ (void)isMatchedWithCallback:(void (^)(BOOL))callback {
    UserObject * cUser = [UserObject currentUser];
    AVQuery * queryFirst = [AVQuery queryWithClassName:MatchClassName];
    [queryFirst whereKey:@"userOne" equalTo:cUser.user];
    AVQuery * querySecond = [AVQuery queryWithClassName:MatchClassName];
    [querySecond whereKey:@"userTwo" equalTo:cUser.user];
    AVQuery * query = [AVQuery orQueryWithSubqueries:[NSArray arrayWithObjects:querySecond,queryFirst, nil]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if (objects && objects.count > 0) {
            MatchObject * match = [MatchObject objectWithObject:objects[0]];
            if (match) {
                callback (YES);
            } else {
                callback (NO);
            }
        } else {
            callback(NO);
        }

    }];
    
}


@end
