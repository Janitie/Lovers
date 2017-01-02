//
//  Memory.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
#import "RecordObject.h"

static NSString * MemoryClassName = @"Memory";

@interface Memory : AVObject

@property (nonatomic, readonly) AVRelation * recordsRelation;

- (void)setRecords: (NSArray<RecordObject *> *)records;
- (void)getRecords: (void(^)(NSArray<RecordObject*> *))callback;

+ (instancetype) memory;

@end
