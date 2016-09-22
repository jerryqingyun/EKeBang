//
//  UtilsMacros.h
//  EKeBang
//
//  Created by 慕清云 on 16/9/21.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

// 获取屏幕尺寸
#define kScreenBounds [UIScreen mainScreen].bounds

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height


// 判断系统版本
#define IOS_VERSION [[UIDevice currentDevice] systemVersion]

#define IOS10_OR_LATER ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending )

#define IOS9_OR_LATER ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )

#define IOS8_OR_LATER ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )

#define IOS7_OR_LATER ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )



// 颜色
#define UIColorFromRGB(R, G, B)		[UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define UIColorFromRGBA(R, G, B, A)	[UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

#define UIColorFromHex(Hex)         [UIColor colorWithRed:((Hex & 0xFF0000) >> 16)/255.0f green:((Hex & 0xFF00) >> 8)/255.0f blue:((Hex & 0xFF))/255.0f alpha:1.0f]

#define UIColorFromHexA(Hex, A)		[UIColor colorWithRed:((Hex & 0xFF0000) >> 16)/255.0f green:((Hex & 0xFF00) >> 8)/255.0f blue:((Hex & 0xFF))/255.0f alpha:A]



// 获取图片
#define ImageNamed(...) [UIImage imageNamed:__VA_ARGS__]


/**
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@weakify_self`实现弱引用转换，`@strongify_self`实现强引用转换
 *
 * 示例：
 * @weakify_self
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef    weakify_self
#if __has_feature(objc_arc)
#define weakify_self autoreleasepool{} __weak __typeof__(self) weakSelf = self;
#else
#define weakify_self autoreleasepool{} __block __typeof__(self) blockSelf = self;
#endif
#endif

#ifndef    strongify_self
#if __has_feature(objc_arc)
#define strongify_self try{} @finally{} __typeof__(weakSelf) self = weakSelf;
#else
#define strongify_self try{} @finally{} __typeof__(blockSelf) self = blockSelf;
#endif
#endif


#ifdef DEBUG // 处于开发阶段
#define ELog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define ELog(...)
#endif


/************系统风格****************/


#define EKBTintColor [UIColor whiteColor]                   // 主题色

#define EKBTitleColor UIColorFromRGB(51, 51, 51)            // 所有标题颜色

#define EKBTextContentColor UIColorFromRGB(128, 128, 128)   // 所有文字内容颜色

#define EKBDateContentColor UIColorFromRGB(179, 179, 179)   // 日期文字内容颜色（聊天）

#define EKBBackGroundColor UIColorFromRGB(244, 245, 246)


#define ButtonFont [UIFont systemFontOfSize:14]     // 按钮字体

#define ButtonColor [UIColor whiteColor]            // 按钮颜色




/************系统风格****************/

#endif /* UtilsMacros_h */
