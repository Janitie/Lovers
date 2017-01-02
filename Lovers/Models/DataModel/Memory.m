//
//  Memory.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "Memory.h"

static NSString * KeyRecords = @"records";

@implementation Memory

+ (instancetype) memory {
    return [self objectWithClassName:MemoryClassName];
}

- (AVRelation *)recordsRelation {
    return [self relationForKey:KeyRecords];
}

- (void)setRecords:(NSArray<RecordObject *> *)records
{
    AVRelation * relation = self.recordsRelation;
    for (RecordObject * record in records) {
        [relation addObject:record];
    }
    [self saveInBackground];
}

- (void)getRecords:(void (^)(NSArray<RecordObject *> *))callback
{
    AVQuery * query = [self.recordsRelation query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        callback(objects);
    }];
}

@end
