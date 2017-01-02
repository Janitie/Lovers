//
//  MemoryDetailViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "MemoryDetailViewController.h"

@interface MemoryDetailViewController ()

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIView * innerView;
@property (nonatomic, strong) UILabel * textView;
@property (nonatomic, strong) UIImageView * posterImageView;

@property (nonatomic, strong) UIBarButtonItem * rightNavButton;

@end

@implementation MemoryDetailViewController

- (void)viewSetting
{
    [super viewSetting];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.innerView];
    [self.innerView addSubview:self.textView];
    [self.innerView addSubview:self.posterImageView];
    
    [self.navigationController.navigationItem setRightBarButtonItem:self.rightNavButton];
}

- (void)makeConstraints
{
    [super makeConstraints];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(0);
    }];
    
    [self.innerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollView);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.mas_equalTo(self.innerView);
        make.height.mas_equalTo(200);
    }];
    
    [self.posterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.innerView);
        make.top.mas_equalTo(self.textView.mas_bottom);
        make.height.mas_equalTo(self.posterImageView.mas_width);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RECORD";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.backgroundColor = BACKGROUND_COLOR;
    }
    return _scrollView;
}

- (UIView *)innerView
{
    if (!_innerView) {
        _innerView = [UIView new];
        _innerView.backgroundColor = [UIColor whiteColor];
    }
    return _innerView;
}

- (UILabel *)textView
{
    if (!_textView) {
        _textView = [UILabel new];
        _textView.backgroundColor = [UIColor clearColor];
        _textView.textColor = [UIColor blackColor];
    }
    return _textView;
}

- (UIImageView *)posterImageView
{
    if (!_posterImageView) {
        _posterImageView = [UIImageView new];
        _posterImageView.backgroundColor = [UIColor clearColor];
        _posterImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _posterImageView;
}

- (UIBarButtonItem *)rightNavButton
{
    if (!_rightNavButton) {
        _rightNavButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                           style:UIBarButtonItemStylePlain
                                                          target:self
                                                          action:@selector(editButtonDidPush)];
        _rightNavButton.tintColor = DEFAULT_TINT_COLOR;
    }
    return _rightNavButton;
}

#pragma mark - Btn Do
- (void)editButtonDidPush {
    
}

@end
