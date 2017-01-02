//
//  HomeViewController.m
//  Lovers
//
//  Created by 徐琬璇 on 2016/12/30.
//  Copyright © 2016年 noneTobacco. All rights reserved.
//

#import "ServiceUser.h"
#import "ServiceRecord.h"
#import "ServiceCheck.h"
#import "HomeViewController.h"
#import "Memory.h"

@interface HomeViewController ()

@property (nonatomic, strong) CheckObject * tempCheck;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"纪念";
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;

   
                                
//    WS(weakSelf);
    [ServiceCheck findCheckWithStatus:NO callback:^(NSArray<CheckObject *> *checkList, NSError *error) {
        if (checkList && checkList.count > 0) {
            for (CheckObject * cObject in checkList) {
                NSLog(@"%@",cObject.title);
            }
        }
        else {
            NSLog(@"not some");
        }
    }];
    
//    [ServiceCheck findAllCheckCallback:^(NSArray<CheckObject *> *checkList, NSError *error) {
//        if (checkList && checkList.count > 0) {
//            for (CheckObject * cObject in checkList) {
//                NSLog(@"%@",cObject.title);
//            }
//        }
//        else {
//            NSLog(@"not any");
//        }
//    }];
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Protocol
- (BOOL)needCustomNavigation
{
    return YES;
}

- (BOOL)needHideBottomBar
{
    return NO;
}

- (BOOL)needsRefreshFooter
{
    return YES;
}

@end
