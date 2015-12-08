//
//  UITableView+animation.m
//  TableViewCellAnimation
//
//  Created by 谭启宏 on 15/12/8.
//  Copyright © 2015年 谭启宏. All rights reserved.
//

#import "UITableView+animation.h"

@implementation UITableView (animation)

- (void)animationWithCell:(UITableViewCell *)cell {
    cell.alpha = 0;
    CGAffineTransform transformScale = CGAffineTransformMakeScale(0.3,0.8); //缩放
    CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0.5, 0.6);//改变位置
    
    cell.transform = CGAffineTransformConcat(transformScale, transformTranslate);
    [self bringSubviewToFront:cell];
    
    [UIView animateWithDuration:.4f
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         
                         cell.alpha = 1;
                         
                         //清空 transform
                         
                         cell.transform = CGAffineTransformIdentity;
                     } completion:nil];
}

- (void)animationWithCellContentView:(UITableViewCell *)cell {
    cell.contentView.alpha = 0;
    CGAffineTransform transformScale = CGAffineTransformMakeScale(0.3,0.8); //缩放
    CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0.5, 0.6);//改变位置
    
    cell.contentView.transform = CGAffineTransformConcat(transformScale, transformTranslate);
    [self bringSubviewToFront:cell.contentView];
    
    [UIView animateWithDuration:.4f
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         
                         cell.contentView.alpha = 1;
                         
                         //清空 transform
                         
                         cell.contentView.transform = CGAffineTransformIdentity;
                     } completion:nil];
}

@end
