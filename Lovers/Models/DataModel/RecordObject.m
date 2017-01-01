//
//  RecordObject.m
//  Lovers
//
//  Created by 徐琬璇 on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "RecordObject.h"

static NSString * const KeyTitle = @"title";
static NSString * const KeyCreator = @"creator";
static NSString * const KeyImgUrl = @"imgUrl";
static NSString * const KeyContent = @"content";

@implementation RecordObject

+ (instancetype) Record {
    return [super objectWithClassName:RecordClass];
}

- (void)setTitle:(NSString *)title
{
    [self setObject:title forKey:KeyTitle];
}

- (NSString *)title
{
    return [self objectForKey:KeyTitle];
}

- (void)setContent:(NSString *)content
{
    [self setObject:content forKey:KeyContent];
}

- (NSString *)content
{
    return [self objectForKey:KeyContent];
}

- (void)setImgUrl:(NSString *)imgUrl
{
    [self setObject:imgUrl forKey:KeyImgUrl];
}

- (NSString *)imgUrl
{
    return [self objectForKey:KeyImgUrl];
}

- (void)setCreator:(AVUser *)creator
{
    [self setObject:creator forKey:KeyCreator];
}

- (AVUser *)creator
{
    return [self objectForKey:KeyCreator];
}

@end
