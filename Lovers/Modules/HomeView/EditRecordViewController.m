//
//  EditRecordViewController.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/3.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "EditRecordViewController.h"
#import "ServiceRecord.h"
#import "CheckObject.h"

@interface EditRecordViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) CheckObject * checkObject;
@property (nonatomic, copy) NSString * imgUrl;

@end

@implementation EditRecordViewController

- (id)initWithCheckObject:(CheckObject *)checkObject
{
    self = [super init];
    if (self) {
        self.checkObject = checkObject;
    }
    return self;
}

- (void)viewSetting {
    [super viewSetting];
    
    self.titleTextField.text = self.checkObject.title;
    
//    AVFile * file
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setPosterImageButtonDo:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)finishEditButtonDo:(id)sender {
    [MBProgressHUD showHUDinKeyWindow];
    [ServiceRecord creatRecordWithCheck:self.checkObject
                                  Title:self.titleTextField.text
                                content:self.contentTextView.text
                                 imgUrl:self.imgUrl
                               callback:^(BOOL succeed) {
                                   [MBProgressHUD hideHUDinKeyWindow];
                                   if (succeed) {
                                       [MBProgressHUD showQuickTipWithTitle:@"创建纪录成功！" withText:nil];
                                       [self.navigationController popToRootViewControllerAnimated:YES];
                                   }
                               }];
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage * image = info[UIImagePickerControllerEditedImage];
    WS(weakSelf);
    [picker dismissViewControllerAnimated:YES completion:^{
        [weakSelf uploadImage:image];
    }];
}

#pragma mark - Data Handle
- (void)uploadImage: (UIImage *)image {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.detailsLabelText = @"正在上传图片...";
    hud.progress = 0.0f;
    NSData * imgData = UIImageJPEGRepresentation(image, 0.8f);
    AVFile * file = [AVFile fileWithName:@"recordImage" data:imgData];
    WS(weakSelf);
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        [hud hide:YES];
        if (!error) {
            weakSelf.imgUrl = file.url;
            [weakSelf.posterImageView setImage:image];
            [MBProgressHUD showQuickTipWithTitle:@"上传图片成功！" withText:nil];
        }
    } progressBlock:^(NSInteger percentDone) {
        hud.progress = percentDone / 100.0f;
    }];
    
}


@end
