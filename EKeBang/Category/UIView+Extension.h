//
//  UIView+Extension.h
//  EKeBang
//
//  Created by 慕清云 on 16/9/21.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat view_x;
@property (nonatomic, assign) CGFloat view_y;
@property (nonatomic, assign) CGFloat view_width;
@property (nonatomic, assign) CGFloat view_height;
@property (nonatomic, assign) CGSize view_size;

-(void)addLinesForEdge:(UIRectEdge)edge;

-(void)addLineWithStroke:(CGFloat)stroke edge:(UIRectEdge)edge;

-(void)addLineWithColor:(UIColor*)color edge:(UIRectEdge)edge;

-(void)addLineWithStroke:(CGFloat)stroke color:(UIColor*)color edge:(UIRectEdge)edge;

@end
