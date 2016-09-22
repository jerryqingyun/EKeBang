//
//  CBBaseNavigationController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBBaseNavigationController.h"

@interface CBBaseNavigationController ()

@end

@implementation CBBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏不挡住View
    self.navigationBar.translucent = NO;
    
    //设置导航栏背景色
    [[UINavigationBar appearance] setBarTintColor:EKBTintColor];
    //设置导航栏item的颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //设置标题文字颜色和字体大小
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:kFontSize17, NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,nil];
    
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(self.childViewControllers.count > 0){
        [viewController setHidesBottomBarWhenPushed:YES];
        
        UIBarButtonItem *returnButton = [[UIBarButtonItem alloc] initWithImage:[ImageNamed(@"back") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = returnButton;
    }

    [super pushViewController:viewController animated:YES];
}




- (void)back{
    [self popViewControllerAnimated:YES];
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
