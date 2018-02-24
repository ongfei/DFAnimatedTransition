//
//  UINavigationController+DFTransition.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+DFTransition.h"

@interface UINavigationController (DFTransition)

- (void)df_pushViewController:(UIViewController *)viewController animationType:(DFTransitionAnimationType) animationType;
- (void)df_pushViewController:(UIViewController *)viewController makeTransition:(DFAnimationBlock)animationBlock;


- (UIViewController *)df_popViewControllerAnimated:(BOOL)animated;

@end
