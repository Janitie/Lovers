//
//  AppDelegate.h
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/29.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import <AVOSCloud/AVOSCloud.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

- (void)changeToLoginView;
- (void)changeToMainView;

@end

