//
//  ServiceUser.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceUser : NSObject

//// 用户注册
//+ (void) signUpWithMobilephoneNumber:(NSString *)number password:(NSString *)password callback:(void(^)(BOOL))block;
//// Log in
//+ (void) logInWithMobilephoneNumber:(NSString *)number password:(NSString *)password callback:(void(^)(BOOL))block;

//signUp
+ (void) signUpWithOpenId:(NSString *)openid username:(NSString *)username password:(NSString *)password callback:(void(^)(BOOL))callback;



@end
