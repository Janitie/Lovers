//
//  HomeTableViewCell.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

+ (UINib *) cellNib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

+ (NSString *)CellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (CGFloat)cellHeight
{
    return 125.0f;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
