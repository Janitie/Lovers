//
//  LocalDataObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Memory;

@interface LocalDataObject : NSObject

@property (nonatomic, strong) Memory * currentMemory;

+ (id)Instance;

@end
