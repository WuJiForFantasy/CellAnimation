//
//  ViewController.m
//  TableViewCellAnimation
//
//  Created by 谭启宏 on 15/12/8.
//  Copyright © 2015年 谭启宏. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "WJFPSLabel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;//列表

@end

@implementation ViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"cellID"];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemPressed)];
    self.navigationItem.rightBarButtonItem = right;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:[WJFPSLabel new]];
    self.navigationItem.leftBarButtonItem = left;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    cell.contentView.alpha = 0.3;
    CGAffineTransform transformScale = CGAffineTransformMakeScale(0.3,0.8); //缩放
    CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0.5, 0.6);//改变位置
    
    cell.contentView.transform = CGAffineTransformConcat(transformScale, transformTranslate);
    [tableView bringSubviewToFront:cell.contentView];
    [UIView animateWithDuration:.4f
                          delay:0.05
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         
                         cell.contentView.alpha = 1;
                         
                         //清空 transform
                         
                         cell.contentView.transform = CGAffineTransformIdentity;
                     } completion:nil];


    
 
}

#pragma mark - 事件监听

- (void)rightItemPressed {
    NSLog(@"刷新tableView");
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
