//
//  ServiceRecord.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "ServiceRecord.h"
#import "UserObject.h"

@implementation ServiceRecord

#pragma mark - creat Record
+ (void)creatRecordWithCheck:(CheckObject *)cObject Title:(NSString *)title content:(NSString *)content imgUrl:(NSString *)imgUrl callback:(void (^)(BOOL))callback {
    RecordObject * newRecord = [RecordObject newObject];
    newRecord.title = title;
    newRecord.content = content;
    newRecord.imgUrl = imgUrl;
    newRecord.creator = [UserObject currentUser].user;
    
    [newRecord.avObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            [ServiceCheck changeStatusWithObject:cObject Callback:^(BOOL succeeded) {
                if (succeeded) {
                    Memory * cMemo = [[LocalDataObject Instance] currentMemory];
                    [cMemo setRecords:@[newRecord]
                             callback:^(BOOL succeed, NSError *error) {
                                 callback(succeed);
                             }];
                }
            }];
        }
        else {
            callback(error);
        }
    }];
    
}

+ (void)fetchRecordListCallback:(RecordListBlock)callback
{
//    AVQuery *queryUser = [AVQuery queryWithClassName:@"_User"];
//    [queryUser whereKey:@"objectId" equalTo:userId];
//    
//    AVQuery *query = [AVQuery queryWithClassName:RecordClass];
//    [query whereKey:@"creator" matchesQuery:queryUser];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        callback(objects, error);
//    }];
    
    UserObject * cUser = [UserObject currentUser];
    if (cUser) {
        
    }
    else {
        NSLog(@"no entry");
    }
}

@end
