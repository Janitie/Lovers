//
//  ServiceUser.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserObject.h"
#import "MatchObject.h"
#import "Memory.h"

#define DEFAULT_PASSWORD @"12345"

@interface ServiceUser : NSObject

//signUp
+ (void) signUpWithUsername:(NSString *)username nickname:(NSString *)nickname iconUrl:(NSString *)iconUrl callback:(void(^)(BOOL))callback;

//logIn
+ (void) logInWithUsername:(NSString *)username password:(NSString *)password callback:(void(^)(UserObject *,NSString *))callback;

//logOut
+ (void) exit;

//match
+ (void) matchUserWithCode:(NSString *)mCode callback:(void(^)(BOOL succeed, NSError *error))callback;

//Matched?
+ (void) isMatchedWithCallback:(void(^)(BOOL,Memory *))callback;

//dismatch

@end
