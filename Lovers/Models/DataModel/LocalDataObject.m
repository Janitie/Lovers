//
//  LocalDataObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "LocalDataObject.h"

static LocalDataObject * s_instance;

@implementation LocalDataObject

+ (id)Instance
{
    if (!s_instance) {
        s_instance = [LocalDataObject new];
    }
    return s_instance;
}

@end
