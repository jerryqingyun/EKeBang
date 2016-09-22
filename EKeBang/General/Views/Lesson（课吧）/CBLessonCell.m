//
//  CBLessonCell.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/22.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBLessonCell.h"

@implementation CBLessonCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenWidth/2.14)];
        bgImgView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:bgImgView];
        self.bgImgView = bgImgView;
        
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/3.41-20, 10, kScreenWidth-kScreenWidth/3.41-30, 165)];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = kFontSize18;
        [self.contentView addSubview:titleLab];
        self.titleLab = titleLab;
        

        UIImageView *bookImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, (self.bgImgView.view_height+10)/1.43, self.bgImgView.view_height)];
        bookImgView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:bookImgView];
        self.bookImgView = bookImgView;
        
        
        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/3.41-30, 0, kScreenWidth-kScreenWidth/3.41-40, bgImgView.view_height/4)];
        contentLab.textColor = [UIColor whiteColor];
        contentLab.textAlignment = NSTextAlignmentCenter;
        contentLab.numberOfLines = 3;
        contentLab.font = kFontSize13;
        [self.bgImgView addSubview:contentLab];
        self.contentLab = contentLab;
        
        
        UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/3.41-50, contentLab.view_height, kScreenWidth-kScreenWidth/3.41-80, 1)];
        lineView.backgroundColor = [UIColor whiteColor];
        [self.bgImgView addSubview:lineView];
        
        
        
        UIView *buttonBgView = [[UIView alloc] initWithFrame:CGRectMake(lineView.view_x, lineView.view_y+2, lineView.view_width, 40)];
        buttonBgView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:buttonBgView];
        
        
        
        UIButton *audioBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        audioBtn.frame = CGRectMake(0, 10, 20, 20);
        [audioBtn setImage:ImageNamed(@"audio") forState:UIControlStateNormal];
        [buttonBgView addSubview:audioBtn];
        self.audioBtn = audioBtn;
        
        
        UIButton *videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        videoBtn.frame = CGRectMake(95, 10, 20, 20);
        [videoBtn setImage:ImageNamed(@"video") forState:UIControlStateNormal];
        [buttonBgView addSubview:videoBtn];
        self.videoBtn = videoBtn;
        
        
        UIButton *pptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        pptBtn.frame = CGRectMake(170, 10, 20, 20);
        [pptBtn setImage:ImageNamed(@"book") forState:UIControlStateNormal];
        [buttonBgView addSubview:pptBtn];
        self.pptBtn = pptBtn;
        
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.view_height-41, kScreenWidth, 1)];
        separatorView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:separatorView];
        
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.view_height-40, kScreenWidth, 40)];
        bottomView.backgroundColor = [UIColor whiteColor];
        bottomView.alpha = 0.5;
        [self.contentView addSubview:bottomView];
        
        
        UILabel *timeLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
        timeLab.font = kFontSize13;
        [bottomView addSubview:timeLab];
        self.timeLab = timeLab;
        
        
        UILabel *authorLab = [[UILabel alloc] initWithFrame:CGRectMake(timeLab.view_width+20, 0, 40, 40)];
        authorLab.font = kFontSize13;
        [bottomView addSubview:authorLab];
        self.authorLab = authorLab;
        
        
        UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        likeBtn.frame = CGRectMake(kScreenWidth-130, 10, 40, 20);
        likeBtn.titleLabel.font = kFontSize13;
        [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [likeBtn setImage:ImageNamed(@"like") forState:UIControlStateNormal];
        [bottomView addSubview:likeBtn];
        self.likeBtn = likeBtn;
        
        UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        collectBtn.frame = CGRectMake(kScreenWidth-90, 10, 40, 20);
        collectBtn.titleLabel.font = kFontSize13;
        [collectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [collectBtn setImage:ImageNamed(@"collect") forState:UIControlStateNormal];
        [bottomView addSubview:collectBtn];
        self.collectBtn = collectBtn;
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shareBtn.frame = CGRectMake(kScreenWidth-50, 10, 40, 20);
        shareBtn.titleLabel.font = kFontSize13;
        [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [shareBtn setImage:ImageNamed(@"like") forState:UIControlStateNormal];
        [bottomView addSubview:shareBtn];
        self.shareBtn = shareBtn;
        
        [self.contentView addLinesForEdge:UIRectEdgeBottom];
        
        //---------------添加约束---------------//
        @weakify_self;
        [self.bgImgView makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.contentView.top).with.offset(50);
            make.left.equalTo(self.contentView.left);
            make.right.equalTo(self.contentView.right);
            make.bottom.equalTo(self.contentView.bottom);
        }];
        
        
        [self.bookImgView makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.contentView.top);
            make.left.equalTo(self.contentView.left).with.offset(10);
            make.bottom.equalTo(separatorView.top);
//            make.width.equalTo(self.bookImgView.view_height/10*7);
        }];
        
        
        [self.titleLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.left.equalTo(self.bookImgView.right);
            make.top.equalTo(self.contentView.top).with.offset(10);
            make.bottom.equalTo(self.bgImgView.top);
            make.right.equalTo(self.contentView.right).with.offset(-10);
        }];
        
        
        [self.contentLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.bgImgView.top);
            make.left.equalTo(self.bookImgView.right);
            make.right.equalTo(self.bgImgView.right).with.offset(-10);
            make.bottom.equalTo(lineView.top);
            make.width.lessThanOrEqualTo(kScreenWidth-self.bookImgView.view_x-self.bookImgView.view_width-10);
            make.height.greaterThanOrEqualTo(self.bgImgView.view_height/2);
        }];
        

        [lineView makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.left.equalTo(self.contentLab.left).with.offset(20);
            make.top.equalTo(self.contentLab.bottom);
            make.right.equalTo(self.contentLab.right).with.offset(-20);
            make.height.equalTo(1);
        }];
        
        
        [buttonBgView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineView.left);
            make.right.equalTo(lineView.right);
            make.top.equalTo(lineView.bottom);
            make.bottom.equalTo(separatorView.top);
        }];

        
        [self.audioBtn makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonBgView.left);
            make.centerY.equalTo(buttonBgView.centerY);
            make.width.height.equalTo(20);
        }];
        
        
        [self.videoBtn makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(buttonBgView.centerX);
            make.centerY.equalTo(buttonBgView.centerY);
            make.width.height.equalTo(20);
        }];
        
        
        [self.pptBtn makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(buttonBgView.right);
            make.centerY.equalTo(buttonBgView.centerY);
            make.width.height.equalTo(20);
        }];
        
        
        [separatorView makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.bookImgView.bottom);
            make.bottom.equalTo(bottomView.top);
            make.left.equalTo(self.bgImgView.left);
            make.right.equalTo(self.bgImgView.right);
            make.height.equalTo(1);
        }];

        
        [bottomView makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.bgImgView.bottom).with.offset(-40);
            make.left.equalTo(self.contentView.left);
            make.right.equalTo(self.contentView.right);
            make.bottom.equalTo(self.contentView.bottom);
        }];

        
        [self.timeLab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bottomView.left).with.offset(10);
            make.centerY.equalTo(bottomView.centerY);
            make.width.greaterThanOrEqualTo(40);
        }];
        
        
        [self.authorLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.left.equalTo(self.timeLab.right).with.offset(10);
            make.centerY.equalTo(self.timeLab.centerY);
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
            make.right.equalTo(bottomView.right).with.offset(-10);
        }];
    }
    return self;
}


@end
