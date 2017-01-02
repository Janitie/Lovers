//
//  HomeTableViewCell.h
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *recordTitle;
@property (weak, nonatomic) IBOutlet UILabel *achieveTime;
@property (weak, nonatomic) IBOutlet UIImageView *posterImg;

+ (UINib *)cellNib;
+ (CGFloat)cellHeight;
+ (NSString *)CellReuseIdentifier;

@end
