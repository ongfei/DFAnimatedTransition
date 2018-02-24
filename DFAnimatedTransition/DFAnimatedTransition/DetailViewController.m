//
//  DetailViewController.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imageView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
}

-(void)tapAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _imageView.center = self.view.center;
        _imageView.image = [UIImage imageNamed:@"bg.jpg"];
    }
    return _imageView;
}


@end
