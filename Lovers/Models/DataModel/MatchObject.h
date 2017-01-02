//
//  MatchObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

static NSString * MatchClassName = @"Match";

@interface MatchObject : BaseDataModel

@property (nonatomic) AVObject * userOne;
@property (nonatomic) AVObject * userTwo;


@end
