//
//  CustomCell.m
//  TableViewCellAnimation
//
//  Created by 谭启宏 on 15/12/8.
//  Copyright © 2015年 谭启宏. All rights reserved.
//

#import "CustomCell.h"



@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *view=  [[UIView alloc]initWithFrame:CGRectMake(50, 0,300, 30)];
        view.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:view];
    }
    return self;
}

- (void)layoutSubviews {
    
}

@end
