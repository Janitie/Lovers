//
//  TargetTableViewCell.m
//  Lovers
//
//  Created by Horace Yuan on 2017/1/2.
//  Copyright © 2017年 noneTobacco. All rights reserved.
//

#import "TargetTableViewCell.h"

@implementation TargetTableViewCell

+ (UINib *) cellNib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

+ (NSString *)CellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (CGFloat)cellHeight
{
    return 44.0f;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.isComplete = (random()%2)==1? YES:NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Getter & setter
- (void)setIsComplete:(BOOL)isComplete
{
    _isComplete = isComplete;
    [self.completeIcon setImage:_isComplete ?
     [UIImage imageNamed:@"ic_xuanzhong"] :
     [UIImage imageNamed:@"ic_weixuan"]];
}


@end
