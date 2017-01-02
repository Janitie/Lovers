//
//  BaseViewProtocol.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewProtocol <NSObject>

@optional

/// 初始化方法，用于编写view的内容，调用时机在-(void)viewDidLoad中，-(void)bindViewModel前。记得调用[super bindViewModel]
- (void)viewSetting;

/// 初始化方法，用于编写绑定viewModel的内容，调用时机在-(void)viewDidLoad中，-(void)bindViewModel之后。记得调用[super bindViewModel]
- (void)makeConstraints;

/// YES：收起导航栏，显示自定导航栏 NO：显示默认导航栏
- (BOOL)needCustomNavigation;

@end
