//
//  CBArticleViewController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBArticleViewController.h"
#import "CBSearchViewController.h"
#import "CBArticleCell.h"

@interface CBArticleViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation CBArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"好文";
    // Do any additional setup after loading the view.
    
    // 搜索
    UIButton *searchItem = [UIButton buttonWithType:UIButtonTypeCustom];
    searchItem.frame = CGRectMake(0, 0, 32, 32);
    [searchItem setImage:ImageNamed(@"search_normal") forState:UIControlStateNormal];
    [searchItem setImage:ImageNamed(@"search_highlight") forState:UIControlStateHighlighted];
    [searchItem addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:searchItem];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-113) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[CBArticleCell class] forCellReuseIdentifier:@"articleCell"];
    [self.view addSubview:self.tableView];
    
}


#pragma mark -tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"articleCell";
    CBArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CBArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [self createCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"articleCell" cacheByIndexPath:indexPath configuration:^(CBArticleCell *cell) {
        [self createCell:cell atIndexPath:indexPath];
    }];
}


- (void)createCell:(CBArticleCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.articleImageView.image = ImageNamed(@"peitu05");
    cell.titleLab.text = @"我们该如何面对人生无常";
    cell.contentLab.text = @"说到底，我们还是不够谦卑，不肯完全放下心中的傲慢和成见去认识无常，去面对生活中的苦痛。";
    cell.timeLab.text = @"07.01";
    cell.authorLab.text = @"by Hugo";
    [cell.likeBtn setTitle:@"65" forState:UIControlStateNormal];
    [cell.collectBtn setTitle:@"66" forState:UIControlStateNormal];
    [cell.shareBtn setTitle:@"48" forState:UIControlStateNormal];
}



#pragma mark -search
- (void)search{
    CBSearchViewController *searchVC = [[CBSearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
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
