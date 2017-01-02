//
//  ServiceCheck.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckObject.h"
#import "TargetObject.h"

@interface ServiceCheck : NSObject

//creat new
//take from Target
+ (void)creatNewWithTitle:(NSString *)title finishTime:(NSDate *)fTime callback:(void(^)(BOOL succeeded))callback;

//query
+ (void)findInCheckBoxWithTitle:(NSString *)title Callback:(void(^)(BOOL succeeded,CheckObject * checkie))callback;
+ (void)findCheckWithStatus:(BOOL)status callback:(void(^)(NSArray<AVObject *> * checkList,NSError * error))callback;
+ (void)findAllCheckCallback:(void(^)(NSArray<AVObject *>* checkList,NSError * error))callback;

//delete
+ (void)deleteWithTitle:(NSString *)title callback:(void(^)(BOOL succeeded))callback;

//change
+ (void)changeTitleTo:(NSString *)newTitle withObject:(CheckObject *)check callback:(void(^)(BOOL succeeded))callback;
+ (void)changeFinishTimeTo:(NSDate *)newDate withObject:(CheckObject *)check callback:(void(^)(BOOL succeeded))callback;
+ (void)changeStatusWithObject:(CheckObject *)check Callback:(void(^)(BOOL succeeded))callback;

//showTarget
+ (void)showTargetCallback:(void(^)(NSArray<TargetObject *> * targetList,NSError * error))callback;



@end
