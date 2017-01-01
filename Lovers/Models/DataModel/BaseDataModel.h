//
//  BaseDataModel.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

@interface BaseDataModel : AVObject

+ (instancetype)classObject:(NSString *)className;

@end
