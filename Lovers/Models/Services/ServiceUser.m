//
//  ServiceUser.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "ServiceUser.h"
#import "UserObject.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation ServiceUser

+ (void)signUpWithMobilephoneNumber:(NSString *)number password:(NSString *)password callback:(void (^)(BOOL))block
{
    if (number && password) {
        AVUser * user = [AVUser user];
        user.mobilePhoneNumber = number;
        user.password = password;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (!error)
            {
                if (block) {
                    block(succeeded);
                }
            }
        }];
    }
}

+ (void)logInWithMobilephoneNumber:(NSString *)number password:(NSString *)password callback:(void (^)(BOOL))block {
    if (number && password) {
        AVQuery * query = [AVQuery queryWithClassName:UserClass];
        [query getObjectInBackgroundWithId:number block:^(AVObject * _Nullable object, NSError * _Nullable error) {
            if (!error) {
                UserObject * user = (UserObject *)object;
                if ([user.password isEqualToString:password]) {
                    block(object);
                }
                else {
                    
                }
            }
            else {
                NSLog(@"wrong 1");
            }
        }];
    }
}
@end
