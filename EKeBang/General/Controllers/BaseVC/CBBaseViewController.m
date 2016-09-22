//
//  CBBaseViewController.m
//  EKeBang
//
//  Created by 慕清云 on 16/9/20.
//  Copyright © 2016年 PinXiang. All rights reserved.
//

#import "CBBaseViewController.h"

@interface CBBaseViewController ()

@end

@implementation CBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = EKBBackGroundColor;
    
    if (IOS7_OR_LATER) {
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
            
            self.edgesForExtendedLayout = UIRectEdgeNone;
            
        }
    }
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
