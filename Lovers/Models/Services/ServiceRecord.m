//
//  ServiceRecord.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "ServiceRecord.h"

@implementation ServiceRecord

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
