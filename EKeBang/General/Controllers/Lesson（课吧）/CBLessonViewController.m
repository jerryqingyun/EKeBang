//
//  CBLessonViewController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBLessonViewController.h"
#import "CBLessonCell.h"
@interface CBLessonViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *lessonTableView;

@end

@implementation CBLessonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"课吧";
    
    self.lessonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-113) style:UITableViewStylePlain];
    self.lessonTableView.delegate = self;
    self.lessonTableView.dataSource = self;
    self.lessonTableView.showsVerticalScrollIndicator = NO;
    self.lessonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.lessonTableView registerClass:[CBLessonCell class] forCellReuseIdentifier:@"lessonCell"];
    [self.view addSubview:self.lessonTableView];
}


#pragma mark -tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"lessonCell";
    CBLessonCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CBLessonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [self createCell:cell atIndexPath:indexPath];
    
    return cell;
}


- (void)createCell:(CBLessonCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.bgImgView.image = ImageNamed(@"kebabeijing");
    cell.bookImgView.image = ImageNamed(@"shu01");
    cell.titleLab.text = @"我们该如何面对人生无常";
    cell.contentLab.text = @"说到底，我们还是不够谦卑，不肯完全放下心中的傲慢和成见去认识无常，去面对生活中的苦痛";
    cell.timeLab.text = @"07.01";
    cell.authorLab.text = @"by Hugo";
    [cell.likeBtn setTitle:@"65" forState:UIControlStateNormal];
    [cell.collectBtn setTitle:@"66" forState:UIControlStateNormal];
    [cell.shareBtn setTitle:@"48" forState:UIControlStateNormal];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"lessonCell" cacheByIndexPath:indexPath configuration:^(CBLessonCell *cell) {
        [self createCell:cell atIndexPath:indexPath];
    }];;
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
