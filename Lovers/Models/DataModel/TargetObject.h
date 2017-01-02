//
//  TargetObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

static NSString * TargetClass = @"Target";

@interface TargetObject : AVObject

@property (nonatomic) NSString * title;

+ (instancetype)Target;

@end
