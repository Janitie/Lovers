//
//  ServiceUser.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceUser : NSObject

/// 用户注册
+ (void) signUpWithUserName:(NSString *)userName password:(NSString *)password callback:(void(^)(BOOL))block;


    
@end
