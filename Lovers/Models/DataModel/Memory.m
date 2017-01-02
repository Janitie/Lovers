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

- (NSString *)className {
    return MemoryClassName;
}

- (AVRelation *)recordsRelation {
    return [self.avObject relationForKey:KeyRecords];
}

- (void)setRecords:(NSArray<RecordObject *> *)records
{
    AVRelation * relation = self.recordsRelation;
    for (RecordObject * record in records) {
        [relation addObject:record.avObject];
    }
    [self.avObject saveInBackground];
}

- (void)getRecords:(void (^)(NSArray<RecordObject *> *))callback
{
    AVQuery * query = [self.recordsRelation query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        callback(objects);
    }];
}

@end
