//
//  CheckObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

static NSString * CheckClass = @"Check";

@interface CheckObject : AVObject

@property (nonatomic) NSString * userId;
@property (nonatomic) NSString * title;
@property (nonatomic) NSDate * finishTime;
@property (nonatomic) BOOL isComplete;

+ (instancetype) Check;

@end
