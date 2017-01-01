//
//  BaseDataModel.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "BaseDataModel.h"

@implementation BaseDataModel

+ (instancetype) classObject:(NSString *)className {
    return (BaseDataModel *)[AVObject objectWithClassName:className];
}

@end
