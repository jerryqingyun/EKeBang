//
//  CBMeViewController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBMeViewController.h"
#import "UIBarButtonItem+Badge.h"
#import "CBMeCell.h"
#import "UIButton+Extension.h"
@interface CBMeViewController ()< UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *iconArr;
@property (nonatomic, strong) NSMutableArray *titleArr;


@end

@implementation CBMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";
    
    // 消息
    UIButton *messageItem = [UIButton buttonWithType:UIButtonTypeCustom];
    messageItem.frame = CGRectMake(0, 0, 32, 32);
    [messageItem setImage:ImageNamed(@"message") forState:UIControlStateNormal];
    [messageItem addTarget:self action:@selector(messageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:messageItem];
    self.navigationItem.leftBarButtonItem = leftItem;
    // 设置数值使红点显示
    self.navigationItem.leftBarButtonItem.badgeValue = @"1";
    self.navigationItem.leftBarButtonItem.badgeBGColor = [UIColor redColor];
    
    // 设置
    UIButton *settingItem = [UIButton buttonWithType:UIButtonTypeCustom];
    settingItem.frame = CGRectMake(0, 0, 32, 32);
    [settingItem setImage:ImageNamed(@"setting") forState:UIControlStateNormal];
    [settingItem addTarget:self action:@selector(settingAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:settingItem];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    // icon数据
    self.iconArr = [NSMutableArray arrayWithObjects:@"myPoints", @"pointsMall", @"myCollect", @"myInvitationCode", @"contribute", @"feedback", nil];
    self.titleArr = [NSMutableArray arrayWithObjects:@"我的积分", @"积分商城", @"我的收藏", @"我的邀请码", @"投稿", @"积分反馈", nil];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-113) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[CBMeCell class] forCellWithReuseIdentifier:@"MeCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    [self.view addSubview:self.collectionView];
    
    
    
}


#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MeCell";
    CBMeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.iconView.image = ImageNamed([self.iconArr objectAtIndex:indexPath.row]);
    cell.titleLab.text = [self.titleArr objectAtIndex:indexPath.row];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];
        UIButton *bgImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bgImgBtn.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth/1.39);
        [bgImgBtn setBackgroundImage:ImageNamed(@"myBackgroundView") forState:UIControlStateNormal];
        [bgImgBtn setBackgroundImage:ImageNamed(@"myBackgroundView") forState:UIControlStateHighlighted];
        [reusableView addSubview:bgImgBtn];
        
        UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        headBtn.frame = CGRectMake((kScreenWidth-68)/2, 40, kScreenWidth/5.5, kScreenWidth/5.5);
        headBtn.layer.cornerRadius = 34;
        headBtn.layer.masksToBounds = YES;
        headBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        headBtn.layer.borderWidth = 1;
        headBtn.layer.cornerRadius = headBtn.view_width/2;
        [headBtn setBackgroundImage:ImageNamed(@"wodetouxiang") forState:UIControlStateNormal];
        [headBtn setBackgroundImage:ImageNamed(@"wodetouxiang") forState:UIControlStateHighlighted];
        [reusableView addSubview:headBtn];
        
        
        UILabel *nickNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 128, kScreenWidth, 20)];
        nickNameLab.font = kFontSize15;
        nickNameLab.textColor = [UIColor whiteColor];
        nickNameLab.textAlignment = NSTextAlignmentCenter;
        nickNameLab.text = @"慕清云";
        [reusableView addSubview:nickNameLab];
        
        UILabel *scoreLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 163, kScreenWidth, 20)];
        scoreLab.font = kFontSize15;
        scoreLab.textColor = [UIColor whiteColor];
        scoreLab.textAlignment = NSTextAlignmentCenter;
        scoreLab.text = [NSString stringWithFormat:@"当前积分：%d",50];
        [reusableView addSubview:scoreLab];
        
        UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        signBtn.frame = CGRectMake(kScreenWidth-55, 10, 50, 50);
        signBtn.titleLabel.font = kFontSize14;
        signBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [signBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [signBtn setTitle:@"未签到" forState:UIControlStateNormal];
        [signBtn setImage:ImageNamed(@"sign") forState:UIControlStateNormal];
        [signBtn setImage:ImageNamed(@"sign") forState:UIControlStateHighlighted];
        [signBtn verticalImageAndTitle:3];

        [reusableView addSubview:signBtn];
        
        //-------------添加约束--------------
        [bgImgBtn makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(reusableView);
        }];
        
        
        [headBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(reusableView.top).with.offset(reusableView.view_height/6.75);
            make.centerX.equalTo(reusableView.centerX);
            make.width.height.equalTo(kScreenWidth/5.5);
            headBtn.layer.cornerRadius = headBtn.view_width/2;
        }];
        
        [nickNameLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headBtn.bottom).with.offset(15);
            make.centerX.equalTo(headBtn.centerX);
        }];
        
        [scoreLab makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(nickNameLab.bottom).with.offset(5);
            make.centerX.equalTo(nickNameLab.centerX);
        }];
        
        [signBtn makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(reusableView.right).with.offset(-5);
            make.top.equalTo(reusableView.top).with.offset(10);
            make.width.height.equalTo(50);
        }];
    }
    
    
    return reusableView;
}


#pragma mark -UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}




#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(kScreenWidth/3, kScreenWidth/3/1.25);
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 0, 0, 0);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, kScreenWidth/1.39);
}




#pragma mark -BarButtonAction
// 消息
- (void)messageAction:(UIButton *)sender{
    
}

// 设置
- (void)settingAction:(UIButton *)sender{
    
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
