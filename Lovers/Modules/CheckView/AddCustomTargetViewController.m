//
//  AddCustomTargetViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "AddCustomTargetViewController.h"
#import "CheckObject.h"
#import "ServiceCheck.h"

@interface AddCustomTargetViewController ()

@property (nonatomic, assign) BOOL isModify;
@property (nonatomic, strong) NSString * targetTitle;
@property (nonatomic, strong) CheckObject * checkObject;

@property (nonatomic, strong) UIDatePicker * datePicker;

@end

@implementation AddCustomTargetViewController

- (id)init {
    self = [super init];
    if (self) {
        self.isModify = NO;
    }
    return self;
}

- (id)initWithTargetTitle:(NSString *)targetTitle
{
    self = [super init];
    if (self) {
        self.isModify = NO;
        self.targetTitle = targetTitle;
    }
    return self;
}

- (id)initWithCheckObject:(CheckObject *)checkObject
{
    self = [super init];
    if (self) {
        self.isModify = YES;
        self.checkObject = checkObject;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.isModify) {
        self.planTitleTextField.text = self.checkObject.title;
        NSDateFormatter * formatter = [NSDateFormatter new];
        formatter.dateFormat = @"yyyy-MM-dd";
        self.planTimeTextField.text = [formatter stringFromDate:self.checkObject.finishTime];
    } else {
        self.planTitleTextField.text = self.targetTitle;
    }
}

- (void)viewSetting
{
    [super viewSetting];
    
    self.planTimeTextField.inputView = self.datePicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter

- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 280)];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}

- (void)dateChange:(id)sender {
    NSDateFormatter * formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd";
    self.planTimeTextField.text = [formatter stringFromDate:self.datePicker.date];
}

- (IBAction)comfirmButtonDo:(id)sender {
    [MBProgressHUD showHUDinKeyWindow];
    [ServiceCheck creatNewWithTitle:self.planTitleTextField.text finishTime:self.datePicker.date callback:^(BOOL succeeded) {
        [MBProgressHUD hideHUDinKeyWindow];
        if (succeeded) {
            [MBProgressHUD showQuickTipWithTitle:@"创建成功" withText:nil];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
}

@end
