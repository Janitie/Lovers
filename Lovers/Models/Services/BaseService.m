//
//  BaseService.m
//  Mintour
//
//  Created by Fish on 15/9/14.
//  Copyright (c) 2015年 gemo. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

+ (instancetype)shareService {
	static id share_service = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		share_service = [[[self class] alloc] init];
	});
	return share_service;
}



@end
