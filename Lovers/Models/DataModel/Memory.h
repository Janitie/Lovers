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

@interface Memory : BaseDataModel

@property (nonatomic, readonly) AVRelation * recordsRelation;

- (void)setRecords:(NSArray<RecordObject *> *)records callback:(void(^)(BOOL succeed, NSError *error))callback;
- (void)getRecords: (void(^)(NSArray<RecordObject*> *))callback;


@end
