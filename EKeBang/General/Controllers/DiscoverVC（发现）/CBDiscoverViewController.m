//
//  CBDiscoverViewController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBDiscoverViewController.h"

@interface CBDiscoverViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *discoverTableView;
@property (nonatomic, strong) NSMutableArray *iconArr;
@property (nonatomic, strong) NSMutableArray *titleArr;

@end

@implementation CBDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发现";
    
    self.iconArr = [NSMutableArray arrayWithObjects:@"discover_chapter", @"discover_pointsMall", @"discover_invite", @"discover_Service", nil];
    self.titleArr = [NSMutableArray arrayWithObjects:@"关注分会", @"积分商城", @"邀请好友", @"客服热线", nil];
    
    self.discoverTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-123) style:UITableViewStyleGrouped];
    self.discoverTableView.delegate = self;
    self.discoverTableView.dataSource = self;
    self.discoverTableView.tableFooterView = [[UIView alloc] init];
    self.discoverTableView.showsVerticalScrollIndicator = NO;
    self.discoverTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.discoverTableView];
}


#pragma mark -tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"discoverCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.imageView.image = ImageNamed([self.iconArr objectAtIndex:indexPath.row]);
    cell.textLabel.text = [self.titleArr objectAtIndex:indexPath.row];
    cell.textLabel.font = kFontSize14;
    cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    headView.backgroundColor = self.view.backgroundColor;
    return headView;
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
