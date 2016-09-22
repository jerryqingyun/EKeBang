//
//  CBArticleCell.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/21.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBArticleCell.h"

@implementation CBArticleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentLab.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2.206)];
        imageView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:imageView];
        self.articleImageView = imageView;
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenWidth/2.206, kScreenWidth, 30)];
        titleLab.font = kFontSize18;
        titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab];
        self.titleLab = titleLab;
        
        
        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLab.view_y+titleLab.view_height+10, kScreenWidth, 40)];
        contentLab.font = kFontSize13;
        contentLab.textAlignment = NSTextAlignmentCenter;
        contentLab.textColor = [UIColor darkGrayColor];
        contentLab.numberOfLines = 0;
        [self.contentView addSubview:contentLab];
        self.contentLab = contentLab;
        
        
        UILabel *timeLab = [[UILabel alloc] initWithFrame:CGRectMake(10, self.contentView.view_height-30, 40, 20)];
        timeLab.font = kFontSize13;
        [self.contentView addSubview:timeLab];
        self.timeLab = timeLab;
        
        UILabel *authorLab = [[UILabel alloc] initWithFrame:CGRectMake(timeLab.view_x+timeLab.view_width+10, self.contentView.view_height-30, 40, 20)];
        authorLab.font = kFontSize13;
        [self.contentView addSubview:authorLab];
        self.authorLab = authorLab;
        
        
        UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        likeBtn.frame = CGRectMake(kScreenWidth-130, self.contentView.view_height-30, 40, 20);
        likeBtn.titleLabel.font = kFontSize13;
        [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [likeBtn setImage:ImageNamed(@"like") forState:UIControlStateNormal];
        [self.contentView addSubview:likeBtn];
        self.likeBtn = likeBtn;
        
        UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        collectBtn.frame = CGRectMake(kScreenWidth-90, self.contentView.view_height-30, 40, 20);
        collectBtn.titleLabel.font = kFontSize13;
        [collectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [collectBtn setImage:ImageNamed(@"collect") forState:UIControlStateNormal];
        [self.contentView addSubview:collectBtn];
        self.collectBtn = collectBtn;
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shareBtn.frame = CGRectMake(kScreenWidth-50, self.contentView.view_height-30, 40, 20);
        shareBtn.titleLabel.font = kFontSize13;
        [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [shareBtn setImage:ImageNamed(@"like") forState:UIControlStateNormal];
        [self.contentView addSubview:shareBtn];
        self.shareBtn = shareBtn;
        
        
//-------------添加约束--------------
        
        @weakify_self;
        [self.articleImageView makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.left.equalTo(self.contentView.left);
            make.right.equalTo(self.contentView.right);
            make.top.equalTo(self.contentView.top);
            make.height.equalTo(kScreenWidth/2.206);
        }];
        
        
        [self.titleLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.articleImageView.bottom).with.offset(10);
            make.left.equalTo(self.contentView.left);
            make.right.equalTo(self.contentView.right);
            make.bottom.equalTo(self.contentLab.top).with.offset(-10);
        }];
        
        [self.contentLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.titleLab.bottom).with.offset(10);
            make.left.equalTo(self.contentView.left).with.offset(15);
            make.right.equalTo(self.contentView.right).with.offset(-15);
            make.height.greaterThanOrEqualTo(20);
        }];
        
        [self.timeLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.contentLab.bottom).with.offset(15);
            make.left.equalTo(self.contentView.left).with.offset(10);
            make.right.equalTo(self.authorLab.left).with.offset(-10);
            make.bottom.equalTo(self.contentView.bottom).with.offset(-10);
        }];
        
        
        [self.authorLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.centerY.equalTo(self.timeLab.centerY);
            make.left.equalTo(self.timeLab.right).with.offset(10);
            CGFloat authorWidth = kScreenWidth-self.timeLab.view_x-self.timeLab.view_width-(kScreenWidth-likeBtn.view_x)-20;
            make.width.lessThanOrEqualTo(authorWidth);
        }];
        
        [self.likeBtn makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.centerY.equalTo(self.timeLab.centerY);
            make.width.greaterThanOrEqualTo(40);
            make.right.equalTo(self.collectBtn.left).with.offset(-5);
        }];
        
        [self.collectBtn makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.centerY.equalTo(self.timeLab.centerY);
            make.width.greaterThanOrEqualTo(40);
            make.right.equalTo(self.shareBtn.left).with.offset(-5);
        }];
        
        [self.shareBtn makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.centerY.equalTo(self.timeLab.centerY);
            make.width.greaterThanOrEqualTo(40);
            make.right.equalTo(self.contentView.right).with.offset(-10);
        }];
        
        
        
    }
    return self;
}

@end
