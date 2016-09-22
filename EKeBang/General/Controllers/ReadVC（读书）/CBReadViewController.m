//
//  CBReadViewController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBReadViewController.h"

@interface CBReadViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *readTableView;

@end

@implementation CBReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"读书";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
