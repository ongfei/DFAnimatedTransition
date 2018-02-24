//
//  ViewController.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/29.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+DFTransition.h"
#import "UINavigationController+DFTransition.h"

#import "SViewController.h"
#import "CollectionView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *methodArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUp];
}


- (void)setUp {
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    table.backgroundColor = [UIColor clearColor];
    [self.view addSubview:table];
    
    table.delegate = self;
    table.dataSource = self;
    
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.methodArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.methodArr[indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    [self df_presentViewController:[SViewController new] animationType:indexPath.row + 1 completion:^{
//       
//        NSLog(@"----");
//    }];
    
//    SViewController *sv = [SViewController new];
//    sv.type = indexPath.row + 1;
    
    CollectionView *sv = [CollectionView new];
    
    
//    [self df_presentViewController:sv makeTransition:^(DFAnimationProperty *property) {
//        
//        property.animationTime = 1;
//        property.animationType = indexPath.row + 1;
//        
//    } completion:^{
//        NSLog(@"动画完成");
//    }];
    
    [self.navigationController df_pushViewController:sv makeTransition:^(DFAnimationProperty *property) {
        property.animationTime = 1;
        property.animationType = indexPath.row + 1;
    }];
}

- (NSMutableArray *)methodArr {
    if (_methodArr) {
        return _methodArr;
    }
    _methodArr =[NSMutableArray arrayWithArray:@[@"SysFade",
                       @"SysPushFromRight",
                       @"SysPushFromLeft",
                       @"SysPushFromTop",
                       @"SysPushFromBottom",
                       @"SysRevealFromRight",
                       @"SysRevealFromLeft",
                       @"SysRevealFromTop",
                       @"SysRevealFromBottom",
                       @"SysMoveInFromRight",
                       @"SysMoveInFromLeft",
                       @"SysMoveInFromTop",
                       @"SysMoveInFromBottom",
                       @"SysCubeFromRight",
                       @"SysCubeFromLeft",
                       @"SysCubeFromTop",
                       @"SysCubeFromBottom",
                       @"SysSuckEffect",
                       @"SysOglFlipFromRight",
                       @"SysOglFlipFromLeft",
                       @"SysOglFlipFromTop",
                       @"SysOglFlipFromBottom",
                       @"SysRippleEffect",
                       @"SysPageCurlFromRight",
                       @"SysPageCurlFromLeft",
                       @"SysPageCurlFromTop",
                       @"SysPageCurlFromBottom",
                       @"SysPageUnCurlFromRight",
                       @"SysPageUnCurlFromLeft",
                       @"SysPageUnCurlFromTop",
                       @"SysPageUnCurlFromBottom",
                       @"SysCameraIrisHollowOpen",
                       @"SysCameraIrisHollowClose",
                       @"Default",
                       @"PageTransition",
                       @"ViewMoveToNextVC",
                       @"ViewMoveNormalToNextVC",
                       @"Cover",
                       @"SpreadFromRight",
                       @"SpreadFromLeft",
                       @"SpreadFromTop",
                       @"SpreadFromBottom",
                       @"PointSpreadPresent",
                       @"Boom",
                       @"BrickOpenVertical",
                       @"BrickOpenHorizontal",
                       @"BrickCloseVertical",
                       @"BrickCloseHorizontal",
                       @"InsideThenPush",
                       @"FragmentShowFromRight",
                       @"FragmentShowFromLeft",
                       @"FragmentShowFromTop",
                       @"FragmentShowFromBottom",
                       @"FragmentHideFromRight",
                       @"FragmentHideFromLeft",
                       @"FragmentHideFromTop",
                       @"FragmentHideFromBottom",
                       @"TipFlip",]];
    
    return _methodArr;
}

@end
