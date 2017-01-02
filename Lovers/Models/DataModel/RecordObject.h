//
//  RecordObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
#import "UserObject.h"

static NSString * RecordClass = @"Record";

@interface RecordObject : BaseDataModel

@property (nonatomic) NSString * title;     //标题
@property (nonatomic) NSString * content;   //文字内容
@property (nonatomic) NSString * imgUrl;    //图片
@property (nonatomic) AVUser * creator;     //创建人ID


@end

typedef void (^RecordBlock)(RecordObject * object, NSError *error);
typedef void (^RecordListBlock)(NSArray<RecordObject *> * objects, NSError * error);
