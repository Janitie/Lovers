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

- (NSString *)className {
    return RecordClass;
}

- (void)setTitle:(NSString *)title
{
    [self.avObject setObject:title forKey:KeyTitle];
}

- (NSString *)title
{
    return [self.avObject objectForKey:KeyTitle];
}

- (void)setContent:(NSString *)content
{
    [self.avObject setObject:content forKey:KeyContent];
}

- (NSString *)content
{
    return [self.avObject objectForKey:KeyContent];
}

- (void)setImgUrl:(NSString *)imgUrl
{
    [self.avObject setObject:imgUrl forKey:KeyImgUrl];
}

- (NSString *)imgUrl
{
    return [self.avObject objectForKey:KeyImgUrl];
}

- (void)setCreator:(UserObject *)creator
{
    [self.avObject setObject:creator forKey:KeyCreator];
}

- (UserObject *)creator
{
    return [self.avObject objectForKey:KeyCreator];
}

@end
