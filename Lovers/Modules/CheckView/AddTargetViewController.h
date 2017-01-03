//
//  AddTargetViewController.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AddTargetViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *targetCard;
@property (weak, nonatomic) IBOutlet UILabel *targetTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *customButton;

@end
