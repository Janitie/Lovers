//
//  BaseViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/1.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIView * customNavBar;
@property (nonatomic, assign) BOOL hasCustomNaviBar;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self baseViewSetting];
    [self baseMakeConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)baseViewSetting
{
    self.hasCustomNaviBar = [self needCustomNavigation];
    
    if (self.hasCustomNaviBar)
    {
        // custom Navigation Bar
        [self.view addSubview:self.customNavBar];
        
    } else {
//        [self.navigationController setNavigationBarHidden:NO];
    }
    
    [self viewSetting];
}

- (void)baseMakeConstraints
{
    if (self.hasCustomNaviBar) {
        [self.customNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self.view);
            make.height.mas_equalTo(navHeight);
        }];
    }
    
    [self makeConstraints];
}


- (BOOL)needCustomNavigation
{
    return  NO;
}

- (void)viewSetting
{

}

- (void)makeConstraints
{
    
}

#pragma mark - Getter 
- (UIView *)customNavBar
{   // 44 287
    if (!_customNavBar) {
        _customNavBar = [UIView new];
        _customNavBar.backgroundColor = DEFAULT_THEME;
        
        // image
        UIImageView *titleImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LOVERS"]];
        [_customNavBar addSubview:titleImg];
        
        [titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_customNavBar.mas_top).offset(20);
            make.bottom.mas_equalTo(_customNavBar.mas_bottom);
            make.centerX.mas_equalTo(_customNavBar.mas_centerX);
            make.width.mas_equalTo(287);
        }];
    }
    return _customNavBar;
}

#pragma mark -

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.hasCustomNaviBar animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}




@end
