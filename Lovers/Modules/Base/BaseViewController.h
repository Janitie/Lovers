//
//  BaseViewController.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

@interface BaseViewController : UIViewController <BaseViewProtocol, UINavigationControllerDelegate>

@property (nonatomic, assign, readonly) BOOL hasCustomNaviBar;

@end
