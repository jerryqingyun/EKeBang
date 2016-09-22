//
//  CBBaseTabBarController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBBaseTabBarController.h"

@interface CBBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation CBBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    CBArticleViewController *article = [[CBArticleViewController alloc]init];
    [self setViewController:article TabBarItemTitle:@"好文" Image:@"tabbar_article_normal" SelectImage:@"tabbar_article_highlight"];
    
    CBReadViewController *read  = [[CBReadViewController alloc]init];
    [self setViewController:read TabBarItemTitle:@"读书" Image:@"tabbar_read_normal" SelectImage:@"tabbar_read_highlight"];
    
    CBLessonViewController *lesson = [[CBLessonViewController alloc]init];
    [self setViewController:lesson TabBarItemTitle:@"课吧" Image:@"tabbar_lesson_normal" SelectImage:@"tabbar_lesson_highlight"];
    
    CBDiscoverViewController *discover = [[CBDiscoverViewController alloc]init];
    [self setViewController:discover TabBarItemTitle:@"发现" Image:@"tabbar_discover_normal" SelectImage:@"tabbar_discover_highlight"];
    
    CBMeViewController *me = [[CBMeViewController alloc]init];
    [self setViewController:me TabBarItemTitle:@"我的" Image:@"tabbar_me_normal" SelectImage:@"tabbar_me_highlight"];
    
    self.delegate = self;
}




// 设置标签栏
- (void)setViewController:(UIViewController *)viewController TabBarItemTitle:(NSString *)title Image:(NSString *)imageName SelectImage:(NSString *)selectImageName{
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = ImageNamed(imageName);
    viewController.tabBarItem.selectedImage = [ImageNamed(selectImageName)imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    [viewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    
    //添加导航栏
    CBBaseNavigationController *nav = [[CBBaseNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
    
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
