//
//  UIViewController+DFTransition.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "UIViewController+DFTransition.h"
#import <objc/runtime.h>

DFTransitionManager *manager;
UINavigationControllerOperation _operation;

@implementation UIViewController (DFTransition)

/**
 自定义present

 @param viewControllerToPresent 目标VC
 @param animationType 动画类型
 @param completion 回调
 */
- (void)df_presentViewController:(UIViewController *)viewControllerToPresent animationType:(DFTransitionAnimationType )animationType completion:(void (^)(void))completion {
    
    [self df_presentViewController:viewControllerToPresent makeTransition:^(DFAnimationProperty *property) {
        
        property.animationType = animationType;
        
    } completion:completion];
}

/**
 自定义present

 @param viewControllerToPresent 目标VC
 @param transitionBlock 动画属性
 */
- (void)df_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(DFAnimationBlock)transitionBlock {
    
    [self df_presentViewController:viewControllerToPresent makeTransition:transitionBlock completion:nil];
}

/**
 自定义present

 @param viewControllerToPresent 目标VC
 @param transitionBlock 动画属性
 @param completion 回调
 */
- (void)df_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(DFAnimationBlock)transitionBlock completion:(void (^)(void))completion {
    
    viewControllerToPresent.transitioningDelegate = viewControllerToPresent;
    
    viewControllerToPresent.callBackAnimationBlock = transitionBlock ? transitionBlock : nil;
    
    [self presentViewController:viewControllerToPresent animated:YES completion:completion];
    
}
//自定义dismiss 默认
- (void)df_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    
    [self df_dismissViewControllerMakeTransition:^(DFAnimationProperty *property) {
        
        property.animationType = DFTransitionAnimationTypeDefault;
        
    } completion:completion];
}

/**
 自定义dismiss

 @param animationType 动画类型
 @param completion 完成回调
 */
- (void)df_dismissViewControllerAnimationType:(DFTransitionAnimationType )animationType completion:(void (^)(void))completion {
    
    [self df_dismissViewControllerMakeTransition:^(DFAnimationProperty *property) {
        
        property.animationType = animationType;
        
    } completion:completion];
}

/**
 自定义dismiss

 @param transitionBlock 动画属性
 @param completion 回调
 */
- (void)df_dismissViewControllerMakeTransition:(DFAnimationBlock)transitionBlock completion:(void (^)(void))completion {
    
    self.transitioningDelegate = self;
    
    self.callBackAnimationBlock = transitionBlock ? transitionBlock : nil;

    [self dismissViewControllerAnimated:YES completion:completion];
}

#pragma mark Delegate
//系统代理
// ********************** Present Dismiss **********************
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    
    !manager ? manager = [[DFTransitionManager alloc] init] : nil ;
    
    DFAnimationProperty *make = [[DFAnimationProperty alloc] init];
    
    self.callBackAnimationBlock ? self.callBackAnimationBlock(make) : nil;
    
    manager = [DFTransitionManager copyPropertyFromObjcet:make toObjcet:manager];
    
    manager.transitionType = DFTransitonTypeDismiss;
    
    return manager;
    
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {

    
    !manager ? manager = [[DFTransitionManager alloc] init] : nil ;
    
    DFAnimationProperty *make = [[DFAnimationProperty alloc] init];
    
    self.callBackAnimationBlock ? self.callBackAnimationBlock(make) : nil;
    
    manager = [DFTransitionManager copyPropertyFromObjcet:make toObjcet:manager];
    
    manager.transitionType = DFTransitionTypePresent;

    return manager;
 
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    
    return nil;
}

//  ********************** Push Pop **********************
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    

    !manager ? manager = [[DFTransitionManager alloc] init] : nil ;
    
    DFAnimationProperty *make = [[DFAnimationProperty alloc] init];
    
    self.callBackAnimationBlock ? self.callBackAnimationBlock(make) : nil;
    
    manager = [DFTransitionManager copyPropertyFromObjcet:make toObjcet:manager];
    
    _operation = operation;
    
    
    if (operation == UINavigationControllerOperationPush) {
        
        manager.transitionType = DFTransitonTypePush;
        
    }else{
        manager.transitionType = DFTransitonTypePop;
    }
    
    return manager;
    
}
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    
 
    return nil;
    
}


//新增属性
- (void)setCallBackAnimationBlock:(DFAnimationBlock)callBackAnimationBlock {
    
    objc_setAssociatedObject(self, @selector(callBackAnimationBlock), callBackAnimationBlock, OBJC_ASSOCIATION_COPY);
}

- (DFAnimationBlock)callBackAnimationBlock {
    
    return objc_getAssociatedObject(self, @selector(callBackAnimationBlock));
}

@end
