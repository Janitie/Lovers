//
//  AddCustomTargetViewController.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "BaseViewController.h"

@class CheckObject;

@interface AddCustomTargetViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *planTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *planTimeTextField;

- (id)initWithTargetTitle: (NSString *)targetTitle;
- (id)initWithCheckObject: (CheckObject *)checkObject;

@end
