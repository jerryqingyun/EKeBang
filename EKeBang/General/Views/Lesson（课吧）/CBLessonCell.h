//
//  CBLessonCell.h
//  EKeBang
//
//  Created by 慕清云 on 16/9/22.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBLessonCell : UITableViewCell

/// 背景
@property (nonatomic, weak) UIImageView *bgImgView;

/// 标题
@property (nonatomic, weak) UILabel *titleLab;

/// 书本图
@property (nonatomic, weak) UIImageView *bookImgView;

/// 内容
@property (nonatomic, weak) UILabel *contentLab;

/// 音频
@property (nonatomic, weak) UIButton *audioBtn;

/// 视频
@property (nonatomic, weak) UIButton *videoBtn;

/// 书本
@property (nonatomic, weak) UIButton *pptBtn;

/// 时间
@property (nonatomic, weak) UILabel *timeLab;

/// 作者
@property (nonatomic, weak) UILabel *authorLab;

/// 赞
@property (nonatomic, weak) UIButton *likeBtn;

/// 收藏
@property (nonatomic, weak) UIButton *collectBtn;

/// 分享
@property (nonatomic, weak) UIButton *shareBtn;


@end
