//
//  UIViewController+DFTransition.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DFTransitionManager.h"
#import "DFAnimationProperty.h"

typedef void(^DFAnimationBlock)(DFAnimationProperty *property);


@interface UIViewController (DFTransition)<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

/**
 动画属性block
 */
@property (nonatomic, copy) DFAnimationBlock callBackAnimationBlock;
//present
- (void)df_presentViewController:(UIViewController *)viewControllerToPresent animationType:(DFTransitionAnimationType )animationType completion:(void (^)(void))completion;

- (void)df_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(DFAnimationBlock)transitionBlock;

- (void)df_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(DFAnimationBlock)transitionBlock completion:(void (^)(void))completion;

//dismiss
- (void)df_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;

- (void)df_dismissViewControllerAnimationType:(DFTransitionAnimationType )animationType completion:(void (^)(void))completion;

- (void)df_dismissViewControllerMakeTransition:(DFAnimationBlock)transitionBlock completion:(void (^)(void))completion;

@end
