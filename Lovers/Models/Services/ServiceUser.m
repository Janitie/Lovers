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

+ (void)signUpWithUserName:(NSString *)userName password:(NSString *)password callback:(void (^)(BOOL))callback
{
    if (userName && password) {
        AVUser * user = [AVUser user];
        user.username = userName;
        user.password = password;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (!error)
            {
                if (callback) {
                    callback(succeeded);
                }
            }
        }];
    }
}
    
@end
