//
//  SViewController.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/29.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "SViewController.h"

#import "UIViewController+DFTransition.h"
#import "UINavigationController+DFTransition.h"

@interface SViewController ()

@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismis)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)dismis {
    
//    [self df_dismissViewControllerAnimationType:self.type completion:^{
//        NSLog(@"dismiss");
//    }];


    [self.navigationController df_popViewControllerAnimated:YES];
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
