//
//  CBArticleCell.h
//  EKeBang
//
//  Created by 慕清云 on 16/9/21.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBArticleCell : UITableViewCell

/// 图片
@property (nonatomic, weak) UIImageView *articleImageView;

/// 标题
@property (nonatomic, weak) UILabel *titleLab;

/// 内容
@property (nonatomic, weak) UILabel *contentLab;

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
