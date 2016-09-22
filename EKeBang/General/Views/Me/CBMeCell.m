//
//  CBMeCell.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/22.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBMeCell.h"

@implementation CBMeCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(45, 20, 60, 60)];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 57, kScreenWidth/3, 20)];
        titleLab.font = kFontSize14;
        titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab];
        self.titleLab = titleLab;
        
        
        [self addLinesForEdge:UIRectEdgeAll];
        
        
        //----------添加约束------------
        @weakify_self;
        [self.iconView makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.contentView.top).with.offset(20);
            make.centerX.equalTo(self.contentView.centerX);
            make.width.height.equalTo(self.contentView.view_width/4.17);
            make.bottom.equalTo(self.titleLab.top).with.offset(-5);
        }];
        
        
        [self.titleLab makeConstraints:^(MASConstraintMaker *make) {
            @strongify_self;
            make.top.equalTo(self.iconView.bottom).with.offset(5);
            make.centerX.equalTo(self.iconView.centerX);
        }];
        
    }
    return self;
}

@end
