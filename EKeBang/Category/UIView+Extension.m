//
//  UIView+Extension.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/21.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setView_x:(CGFloat)view_x
{
    CGRect frame = self.frame;
    frame.origin.x = view_x;
    self.frame = frame;
}

- (CGFloat)view_x
{
    return self.frame.origin.x;
}

- (void)setView_y:(CGFloat)view_y
{
    CGRect frame = self.frame;
    frame.origin.y = view_y;
    self.frame = frame;
}

- (CGFloat)view_y
{
    return self.frame.origin.y;
}

- (void)setView_width:(CGFloat)view_width
{
    CGRect frame = self.frame;
    frame.size.width = view_width;
    self.frame = frame;
}

- (CGFloat)view_width
{
    return self.frame.size.width;
}

- (void)setView_height:(CGFloat)view_height
{
    CGRect frame = self.frame;
    frame.size.height = view_height;
    self.frame = frame;
}

- (CGFloat)view_height
{
    return self.frame.size.height;
}

- (void)setView_size:(CGSize)view_size
{
    CGRect frame = self.frame;
    frame.size = view_size;
    self.frame = frame;
}

- (CGSize)view_size
{
    return self.frame.size;
}



- (void)addLinesForEdge:(UIRectEdge)edge
{
    CGFloat size = 1.0/[[UIScreen mainScreen] scale];
    if (edge & UIRectEdgeBottom) {
        [self addLineWithStroke:size color:[UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0] edge:UIRectEdgeBottom];
    }
    if (edge & UIRectEdgeTop) {
        [self addLineWithStroke:size color:[UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0] edge:UIRectEdgeTop];
    }
    if (edge & UIRectEdgeLeft) {
        [self addLineWithStroke:size color:[UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0] edge:UIRectEdgeLeft];
    }
    if (edge & UIRectEdgeRight) {
        [self addLineWithStroke:size color:[UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0] edge:UIRectEdgeRight];
    }
}

-(void)addLineWithStroke:(CGFloat)stroke edge:(UIRectEdge)edge
{
    if (edge & UIRectEdgeBottom) {
        [self addLineWithStroke:stroke color:[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0] edge:UIRectEdgeBottom];
    }
    if (edge & UIRectEdgeTop) {
        [self addLineWithStroke:stroke color:[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0] edge:UIRectEdgeTop];
    }
    if (edge & UIRectEdgeLeft) {
        [self addLineWithStroke:stroke color:[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0] edge:UIRectEdgeLeft];
    }
    if (edge & UIRectEdgeRight) {
        [self addLineWithStroke:stroke color:[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0] edge:UIRectEdgeRight];
    }
}

-(void)addLineWithColor:(UIColor*)color edge:(UIRectEdge)edge
{
    CGFloat size = 1.0/[[UIScreen mainScreen] scale];
    if (edge & UIRectEdgeBottom) {
        [self addLineWithStroke:size color:color edge:UIRectEdgeBottom];
    }
    if (edge & UIRectEdgeTop) {
        [self addLineWithStroke:size color:color edge:UIRectEdgeTop];
    }
    if (edge & UIRectEdgeLeft) {
        [self addLineWithStroke:size color:color edge:UIRectEdgeLeft];
    }
    if (edge & UIRectEdgeRight) {
        [self addLineWithStroke:size color:color edge:UIRectEdgeRight];
    }
}

-(void)addLineWithStroke:(CGFloat)stroke color:(UIColor*)color edge:(UIRectEdge)edge
{
    UIView *lineView = [[UIView alloc] init];
    [lineView setBackgroundColor:color];
    [self addSubview:lineView];
    [lineView makeConstraints:^(MASConstraintMaker *make) {
        if (edge == UIRectEdgeBottom) {
            make.height.equalTo(stroke);
            make.bottom.equalTo(self.bottom);
            make.leading.equalTo(self.leading);
            make.trailing.equalTo(self.trailing);
        }else if (edge == UIRectEdgeTop) {
            make.height.equalTo(stroke);
            make.top.equalTo(self.top);
            make.leading.equalTo(self.leading);
            make.trailing.equalTo(self.trailing);
        }else if (edge == UIRectEdgeLeft) {
            make.width.equalTo(stroke);
            make.bottom.equalTo(self.bottom);
            make.leading.equalTo(self.leading);
            make.top.equalTo(self.top);
        }else if (edge == UIRectEdgeRight) {
            make.width.equalTo(stroke);
            make.bottom.equalTo(self.bottom);
            make.trailing.equalTo(self.trailing);
            make.top.equalTo(self.top);
        }else {
            make.height.equalTo(stroke);
            make.bottom.equalTo(self.bottom);
            make.leading.equalTo(self.leading);
            make.trailing.equalTo(self.trailing);
        }
    }];
}


@end
