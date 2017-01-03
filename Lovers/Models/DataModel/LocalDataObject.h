//
//  LocalDataObject.h
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Memory;
@class UserObject;

@interface LocalDataObject : NSObject

@property (nonatomic, strong) UserObject * userObject;
@property (nonatomic, strong) NSString * wxOpenId;
@property (nonatomic, strong) NSString * wxNickName;
@property (nonatomic, strong) NSString * wxIconUrl;
@property (nonatomic, strong) NSNumber * wxGender;

@property (nonatomic, strong) Memory * currentMemory;

+ (id)Instance;

@end
