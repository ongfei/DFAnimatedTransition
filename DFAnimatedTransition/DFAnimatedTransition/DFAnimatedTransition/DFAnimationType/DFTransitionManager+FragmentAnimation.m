//
//  DFTransitionManager+FragmentAnimation.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager+FragmentAnimation.h"

@implementation DFTransitionManager (FragmentAnimation)

-(void)fragmentShowNextType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIView *toVCTempView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:fromVC.view];
    
    NSMutableArray *fragmentViews = [[NSMutableArray alloc] init];
    
    CGSize size = fromVC.view.frame.size;
    CGFloat fragmentWidth = 20.0f;
    
    NSInteger rowNum = size.width/fragmentWidth + 1;
    for (int i = 0; i < rowNum ; i++) {
        
        for (int j = 0; j < size.height/fragmentWidth + 1; j++) {
            
            CGRect rect = CGRectMake(i*fragmentWidth, j*fragmentWidth, fragmentWidth, fragmentWidth);
            UIView *fragmentView = [toVCTempView resizableSnapshotViewFromRect:rect  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            [containerView addSubview:fragmentView];
            [fragmentViews addObject:fragmentView];
            fragmentView.frame = rect;
            switch (type) {
                case DFTransitionAnimationTypeFragmentShowFromRight:
                    fragmentView.layer.transform = CATransform3DMakeTranslation( random()%50 *50, 0, 0);
                    
                    break;
                case DFTransitionAnimationTypeFragmentShowFromLeft:
                    fragmentView.layer.transform = CATransform3DMakeTranslation( - random()%50 *50, 0 , 0);
                    
                    break;
                case DFTransitionAnimationTypeFragmentShowFromTop:
                    fragmentView.layer.transform = CATransform3DMakeTranslation(0, - random()%50 *50, 0);
                    
                    break;
                    
                default:
                    fragmentView.layer.transform = CATransform3DMakeTranslation(0, random()%50 *50, 0);
                    
                    break;
            }
            fragmentView.alpha = 0;
        }
        
    }
    
    
    [UIView animateWithDuration:self.animationTime animations:^{
        for (UIView *fragmentView in fragmentViews) {
            fragmentView.layer.transform = CATransform3DIdentity;
            fragmentView.alpha = 1;
            
        }
    } completion:^(BOOL finished) {
        for (UIView *fragmentView in fragmentViews) {
            [fragmentView removeFromSuperview];
        }
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
            fromVC.view.hidden = NO;
        }else{
            [transitionContext completeTransition:YES];
            fromVC.view.hidden = NO;
        }
        
    }];
}
-(void)fragmentShowBackType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView *fromTempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    
    [containerView addSubview:toVC.view];
    
    NSMutableArray *fragmentViews = [[NSMutableArray alloc] init];
    
    CGSize size = fromVC.view.frame.size;
    CGFloat fragmentWidth = 20.0f;
    
    NSInteger rowNum = size.width/fragmentWidth + 1;
    for (int i = 0; i < rowNum ; i++) {
        
        for (int j = 0; j < size.height/fragmentWidth + 1; j++) {
            
            CGRect rect = CGRectMake(i*fragmentWidth, j*fragmentWidth, fragmentWidth, fragmentWidth);
            UIView *fragmentView = [fromTempView resizableSnapshotViewFromRect:rect  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            [containerView addSubview:fragmentView];
            [fragmentViews addObject:fragmentView];
            fragmentView.frame = rect;
        }
        
    }
    
    toVC.view.hidden = NO;
    fromVC.view.hidden = YES;
    
    [UIView animateWithDuration:self.animationTime animations:^{
        for (UIView *fragmentView in fragmentViews) {
            
            CGRect rect = fragmentView.frame;
            
            switch (type) {
                case DFTransitionAnimationTypeFragmentShowFromRight:
                    rect.origin.x = rect.origin.x + random()%50 *50;
                    break;
                case DFTransitionAnimationTypeFragmentShowFromLeft:
                    rect.origin.x = rect.origin.x - random()%50 *50;
                    
                    break;
                case DFTransitionAnimationTypeFragmentShowFromTop:
                    rect.origin.y = rect.origin.y - random()%50 *50;
                    break;
                    
                default:
                    rect.origin.y = rect.origin.y + random()%50 *50;
                    
                    break;
            }
            
            fragmentView.frame = rect;
            fragmentView.alpha = 0.0;
        }
    } completion:^(BOOL finished) {
        for (UIView *fragmentView in fragmentViews) {
            [fragmentView removeFromSuperview];
        }
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
            fromVC.view.hidden = NO;
        }else{
            [transitionContext completeTransition:YES];
            fromVC.view.hidden = NO;
        }
        
    }];
    
    self.willEndInteractiveBlock = ^(BOOL sucess) {
        
        if (sucess) {
            for (UIView *fragmentView in fragmentViews) {
                [fragmentView removeFromSuperview];
            }
            
        }else{
        }
        
    };
    
    
    
}

-(void)fragmentHideNextType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView *fromTempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    
    [containerView addSubview:toVC.view];
    
    NSMutableArray *fragmentViews = [[NSMutableArray alloc] init];
    
    CGSize size = fromVC.view.frame.size;
    CGFloat fragmentWidth = 20.0f;
    
    NSInteger rowNum = size.width/fragmentWidth + 1;
    for (int i = 0; i < rowNum ; i++) {
        
        for (int j = 0; j < size.height/fragmentWidth + 1; j++) {
            
            CGRect rect = CGRectMake(i*fragmentWidth, j*fragmentWidth, fragmentWidth, fragmentWidth);
            UIView *fragmentView = [fromTempView resizableSnapshotViewFromRect:rect  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            [containerView addSubview:fragmentView];
            [fragmentViews addObject:fragmentView];
            fragmentView.frame = rect;
        }
        
    }
    
    toVC.view.hidden = NO;
    fromVC.view.hidden = YES;
    
    [UIView animateWithDuration:self.animationTime animations:^{
        for (UIView *fragmentView in fragmentViews) {
            CGRect rect = fragmentView.frame;
            switch (type) {
                case DFTransitionAnimationTypeFragmentHideFromRight:
                    rect.origin.x = rect.origin.x - random()%50 *50;
                    break;
                case DFTransitionAnimationTypeFragmentHideFromLeft:
                    rect.origin.x = rect.origin.x + random()%50 *50;
                    break;
                case DFTransitionAnimationTypeFragmentHideFromTop:
                    rect.origin.y = rect.origin.y + random()%50 *50;
                    break;
                default:
                    rect.origin.y = rect.origin.y - random()%50 *50;
                    break;
            }
            fragmentView.frame = rect;
            fragmentView.alpha = 0.0;
        }
    } completion:^(BOOL finished) {
        
        for (UIView *fragmentView in fragmentViews) {
            [fragmentView removeFromSuperview];
        }
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
            fromVC.view.hidden = NO;
        }else{
            [transitionContext completeTransition:YES];
            fromVC.view.hidden = NO;
        }
        
    }];
    
}
-(void)fragmentHideBackType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    NSMutableArray *fragmentViews = [[NSMutableArray alloc] init];
    CGSize size = fromVC.view.frame.size;
    CGFloat fragmentWidth = 20.0f;
    
    NSInteger rowNum = size.width/fragmentWidth + 1;
    for (int i = 0; i < rowNum ; i++) {
        
        for (int j = 0; j < size.height/fragmentWidth + 1; j++) {
            
            CGRect rect = CGRectMake(i*fragmentWidth, j*fragmentWidth, fragmentWidth, fragmentWidth);
            UIView *fragmentView = [toVC.view resizableSnapshotViewFromRect:rect  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            [containerView addSubview:fragmentView];
            [fragmentViews addObject:fragmentView];
            fragmentView.frame = rect;
            switch (type) {
                case DFTransitionAnimationTypeFragmentHideFromRight:
                    fragmentView.layer.transform = CATransform3DMakeTranslation(-random()%50 *50, 0, 0);
                    break;
                case DFTransitionAnimationTypeFragmentHideFromLeft:
                    fragmentView.layer.transform = CATransform3DMakeTranslation(random()%50 *50, 0, 0);
                    break;
                case DFTransitionAnimationTypeFragmentHideFromTop:
                    fragmentView.layer.transform = CATransform3DMakeTranslation(0, random()%50 *50, 0);
                    break;
                default:
                    fragmentView.layer.transform = CATransform3DMakeTranslation(0, -random()%50 *50, 0);
                    break;
            }
            fragmentView.alpha = 0;
        }
        
    }
    
    toVC.view.hidden = YES;
    fromVC.view.hidden = NO;
    
    [UIView animateWithDuration:self.animationTime animations:^{
        
        for (UIView *fragmentView in fragmentViews) {
            fragmentView.alpha = 1;
            fragmentView.layer.transform = CATransform3DIdentity;
        }
    } completion:^(BOOL finished) {
        for (UIView *fragmentView in fragmentViews) {
            [fragmentView removeFromSuperview];
        }
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
        }
        toVC.view.hidden = NO;
        
    }];
    
    __weak UIViewController * weakToVC = toVC;
    self.willEndInteractiveBlock = ^(BOOL sucess) {
        if (sucess) {
            for (UIView *fragmentView in fragmentViews) {
                [fragmentView removeFromSuperview];
            }
            weakToVC.view.hidden = NO;
        }else{
            
        }
    };
    
}
@end
