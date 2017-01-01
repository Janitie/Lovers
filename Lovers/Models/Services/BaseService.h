//
//  BaseService.h
//  Mintour
//
//  Created by Fish on 15/9/14.
//  Copyright (c) 2015年 gemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface BaseService : NSObject

+ (instancetype)shareService;

@property (nonatomic, strong) NSString *sessionId;
@property (nonatomic, assign) int userId;


@end
