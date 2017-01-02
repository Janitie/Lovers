//
//  ServiceCheck.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "ServiceCheck.h"

@implementation ServiceCheck

+ (void)creatNewWithTitle:(NSString *)title finishTime:(NSDate *)fTime callback:(void (^)(BOOL))callback{
    CheckObject * newCheck = [CheckObject newObject];
    newCheck.title = title;
    newCheck.finishTime = fTime;
    newCheck.user = [UserObject currentUser].user;
    newCheck.isComplete = NO;
    
    [newCheck.avObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            callback(YES);
        }
        else {
            callback(error);
        }
    }];
}

+ (void)findInCheckBoxWithTitle:(NSString *)title Callback:(void (^)(BOOL succeeded,CheckObject * checkie))callback {
    AVQuery * query = [AVQuery queryWithClassName:CheckClass];
    [query whereKey:@"title" equalTo:title];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects && objects.count > 0) {
            CheckObject * check = [CheckObject objectWithObject:objects[0]];
            callback(YES,check);
        }
        else {
            callback(NO,nil);
        }
    }];
    
}

+ (void)deleteWithTitle:(NSString *)title callback:(void (^)(BOOL))callback {
    [self findInCheckBoxWithTitle:title
                         Callback:^(BOOL succeeded, CheckObject *checkie) {
                             if (succeeded) {
                                 CheckObject * check = [CheckObject objectWithObject:checkie.avObject];
                                 [check.avObject deleteInBackground];
                             }
                         }];
}

@end
