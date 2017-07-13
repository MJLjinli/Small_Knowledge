//
//  MJLFirstViewController.m
//  Small_Knowledge
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "MJLFirstViewController.h"

@interface MJLFirstViewController ()

@end

@implementation MJLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *backVC = [self getBackViewController];
    NSLog(@"前一个控制器%@",NSStringFromClass([backVC class]));
    
}


#pragma mark -获取当前导航控制器下的前一个控制器
- (UIViewController *)getBackViewController
{
    //获得当前控制器所在的索引
    NSInteger myIndex = [self.navigationController.viewControllers indexOfObject:self];
    if (myIndex != 0 && myIndex != NSNotFound) {
        return [self.navigationController.viewControllers objectAtIndex:myIndex - 1];
    }else{
        return nil;
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
