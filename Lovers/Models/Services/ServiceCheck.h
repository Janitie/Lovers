//
//  ServiceCheck.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckObject.h"

@interface ServiceCheck : NSObject

//creat new
//take from Target
+ (void)creatNewWithTitle:(NSString *)title finishTime:(NSDate *)fTime callback:(void(^)(BOOL succeeded))callback;

//query
+ (void)findInCheckBoxWithTitle:(NSString *)title Callback:(void(^)(BOOL succeeded,CheckObject * checkie))callback;

//delete
+ (void)deleteWithTitle:(NSString *)title callback:(void(^)(BOOL succeeded))callback;

//change
//+ (void)changeTitle;

@end
