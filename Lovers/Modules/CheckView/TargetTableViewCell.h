//
//  TargetTableViewCell.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *completeIcon;
@property (weak, nonatomic) IBOutlet UILabel *checkTitle;
@property (weak, nonatomic) IBOutlet UILabel *planTime;
@property (assign, nonatomic) BOOL isComplete;

+ (UINib *)cellNib;
+ (CGFloat)cellHeight;
+ (NSString *)CellReuseIdentifier;

@end
