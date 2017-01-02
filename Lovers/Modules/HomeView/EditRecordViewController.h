//
//  EditRecordViewController.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "BaseViewController.h"

@interface EditRecordViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@end
