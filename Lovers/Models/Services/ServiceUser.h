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
+ (void) signUpWithUsername:(NSString *)username nickname:(NSString *)nickname iconUrl:(NSString *)iconUrl gender:(NSNumber *)gender callback:(void(^)(BOOL succeed))callback;

//logIn
+ (void) logInWithUsername:(NSString *)username  callback:(void(^)(UserObject * user,NSString * mCode))callback;

//logOut
+ (void) exit;

//match
+ (void) matchUserWithCode:(NSString *)mCode callback:(void(^)(BOOL succeed, Memory * memory, NSError *error))callback;

//Matched?
+ (void) isMatchedWithCallback:(void(^)(BOOL succeed,Memory * currentMemo))callback;

//dismatch

@end
