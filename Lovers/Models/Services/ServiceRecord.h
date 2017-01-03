//
//  ServiceRecord.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecordObject.h"
#import "Memory.h"
#import "ServiceCheck.h"

@interface ServiceRecord : NSObject

//creatRecord
+ (void)creatRecordWithCheck:(CheckObject *)cObject Title:(NSString *)title content:(NSString *)content imgUrl:(NSString *)imgUrl callback:(void(^)(BOOL))callback;


+ (void)fetchRecordListWithSkip:(NSInteger)skip
callback:(RecordListBlock)callback;

@end
