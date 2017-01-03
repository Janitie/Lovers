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

+ (void)fetchRecordListWithSkip:(NSInteger)skip callback:(RecordListBlock)callback
{
    Memory * currenMemory = [[LocalDataObject Instance] currentMemory];
    if (currenMemory) {
        [currenMemory.avObject fetchInBackgroundWithBlock:^(AVObject * _Nullable object, NSError * _Nullable error) {
            if (!error) {
                AVQuery *query = [currenMemory.recordsRelation query];
                [query setLimit:10];
                [query setSkip:skip];
                [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                    NSMutableArray * records = [NSMutableArray array];
                    if (objects && objects.count > 0) {
                        for (AVObject * obj in objects) {
                            RecordObject *record = [RecordObject objectWithObject:obj];
                            [records addObject:record];
                        }
                    }
                    callback(records, error);
                }];
            } else {
                callback (nil, nil);
            }
        }];
    }
    else {
        callback(nil, nil);
    }
}

@end
