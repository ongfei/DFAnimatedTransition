//
//  DFTransitionManager+CoverAnimation.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager+CoverAnimation.h"

@implementation DFTransitionManager (CoverAnimation)

-(void)coverTransitionNextAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *tempView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    UIView *containView = [transitionContext containerView];
    
    [containView addSubview:toVC.view];
    [containView addSubview:fromVC.view];
    [containView addSubview:tempView];
    
    tempView.layer.transform = CATransform3DMakeScale(4, 4, 1);
    tempView.alpha = 0.1;
    tempView.hidden = NO;
    
    
    [UIView animateWithDuration:self.animationTime animations:^{
        
        tempView.layer.transform = CATransform3DIdentity;
        tempView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            toVC.view.hidden = YES;
            [transitionContext completeTransition:NO];
        }else{
            toVC.view.hidden = NO;
            [transitionContext completeTransition:YES];
        }
        [tempView removeFromSuperview];
        
    }];
    
}

-(void)coverTransitionBackAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    UIView *containView = [transitionContext containerView];
    
    [containView addSubview:fromVC.view];
    [containView addSubview:toVC.view];
    [containView addSubview:tempView];
    
    fromVC.view.hidden = YES;
    toVC.view.hidden = NO;
    toVC.view.alpha = 1;
    tempView.hidden = NO;
    tempView.alpha = 1;
    
    [UIView animateWithDuration:self.animationTime animations:^{
        tempView.layer.transform = CATransform3DMakeScale(4, 4, 1);
        tempView.alpha = 0.0;
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            
            fromVC.view.hidden = NO;
            [transitionContext completeTransition:NO];
            tempView.alpha = 1;
            
        }else{
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
            
        }
        [tempView removeFromSuperview];
    }];
    
    //小心循环引用
    __weak UIViewController * weakToVC = toVC;
    __weak UIViewController * weakFromVC = fromVC;
    
    self.willEndInteractiveBlock = ^(BOOL success){
        
        if (success) {
            weakToVC.view.hidden = NO;
            [tempView removeFromSuperview];
            
        }else{
            weakFromVC.view.hidden = NO;
            tempView.alpha = 1;
        }
    };
}
@end
