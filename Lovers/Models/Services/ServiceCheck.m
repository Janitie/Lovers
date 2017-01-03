//
//  ServiceCheck.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "ServiceCheck.h"

@implementation ServiceCheck

#pragma mark - creat
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


#pragma mark - query
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

+ (void)findCheckWithStatus:(BOOL)status callback:(void (^)(NSArray<AVObject *> *, NSError *))callback {
    AVQuery * query = [AVQuery queryWithClassName:CheckClass];
    [query whereKey:@"isComplete" equalTo:@(status)];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            callback(objects,nil);
        }
    }];
    
}

+ (void)findAllCheckCallback:(void (^)(NSArray<AVObject *> * checkList, NSError * error))callback {
    AVQuery * query = [AVQuery queryWithClassName:CheckClass];
    [query whereKey:@"user" equalTo:[UserObject currentUser].user];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray * checkList = [NSMutableArray array];
            if (objects && objects.count > 0)
            {
                for (AVObject *obj in objects) {
                    CheckObject * check = [CheckObject objectWithObject:obj];
                    [checkList addObject:check];
                }
            }
            callback(checkList,nil);
        }
    }];
}

#pragma mark - delete
+ (void)deleteWithTitle:(NSString *)title callback:(void (^)(BOOL))callback {
    [self findInCheckBoxWithTitle:title
                         Callback:^(BOOL succeeded, CheckObject *checkie) {
                             if (succeeded) {
                                 CheckObject * check = [CheckObject objectWithObject:checkie.avObject];
                                 [check.avObject deleteInBackground];
                             }
                         }];
}


#pragma mark - change
+ (void)changeTitleTo:(NSString *)newTitle withObject:(CheckObject *)check callback:(void (^)(BOOL))callback {
    [self findInCheckBoxWithTitle:check.title
                         Callback:^(BOOL succeeded, CheckObject *checkie) {
                             if (succeeded) {
                                 checkie.title = newTitle;
                                 [checkie.avObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                                     if (succeeded) {
                                         callback(YES);
                                     }
                                     else {
                                         callback(error);
                                     }
                                 }];
                             }
                         }];
}

+ (void)changeFinishTimeTo:(NSDate *)newDate withObject:(CheckObject *)check callback:(void (^)(BOOL))callback {
    [self findInCheckBoxWithTitle:check.title
                         Callback:^(BOOL succeeded, CheckObject *checkie) {
                             if (succeeded) {
                                 checkie.finishTime = newDate;
                                 [checkie.avObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                                     if (succeeded) {
                                         callback(YES);
                                     }
                                     else {
                                         callback(error);
                                     }
                                 }];
                             }
                         }];

}

+ (void)changeStatusWithObject:(CheckObject *)check Callback:(void (^)(BOOL))callback {
    [self findInCheckBoxWithTitle:check.title
                         Callback:^(BOOL succeeded, CheckObject *checkie) {
                             if (succeeded) {
                                 checkie.isComplete = YES;
                                 [checkie.avObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                                     if (succeeded) {
                                         callback(YES);
                                     }
                                     else {
                                         callback(error);
                                     }
                                 }];
                             }
                         }];
}


#pragma mark - target
+ (void)showTargetCallback:(void (^)(NSArray<TargetObject *> * targetList, NSError * error))callback {
    AVQuery * query = [AVQuery queryWithClassName:TargetClass];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects && objects.count >0) {
            NSMutableArray * tArray = [NSMutableArray array];
            for (AVObject * targetie in objects) {
                TargetObject *tObject = [TargetObject objectWithObject:targetie];
                [tArray addObject:tObject];
            }
            callback(tArray,nil);
        }
        else {
            callback(nil,error);
        }
    }];
}


@end
