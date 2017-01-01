//
//  ServiceRecord.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecordObject.h"

@interface ServiceRecord : NSObject

+ (void)fetchRecordListWithUserId:(NSString *)userId callback:(RecordListBlock)callback;

@end
