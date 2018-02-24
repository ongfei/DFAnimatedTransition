//
//  UINavigationController+DFTransition.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "UINavigationController+DFTransition.h"

@implementation UINavigationController (DFTransition)

- (void)df_pushViewController:(UIViewController *)viewController animationType:(DFTransitionAnimationType) animationType {
    
    [self df_pushViewController:viewController makeTransition:^(DFAnimationProperty *property) {
       
        property.animationType = animationType;
        
    }];
}

- (void)df_pushViewController:(UIViewController *)viewController makeTransition:(DFAnimationBlock)animationBlock {
    
    self.delegate = viewController;
    
    viewController.callBackAnimationBlock = animationBlock ? animationBlock : nil;
    
    [self pushViewController:viewController animated:YES];


}


- (UIViewController *)df_popViewControllerAnimated:(BOOL)animated {

    return [self popViewControllerAnimated:animated];
}

//- (UIViewController *)df_popViewControllerAnimationType:(DFTransitionAnimationType )animationType completion:(void (^)(void))completion {
//    
//    
//    return [self popViewControllerAnimated:animated];
//
//}
//
//- (UIViewController *)df_popViewControllerMakeTransition:(DFAnimationBlock)transitionBlock completion:(void (^)(void))completion {
//    
//    self.delegate = self.viewControllers.lastObject;
//
//    return [self popViewControllerAnimated:animated];
//
//}

@end
