//
//  DFTransitionManager+SpreadAnimation.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager.h"

@interface DFTransitionManager (SpreadAnimation)<CAAnimationDelegate>

- (void)spreadNextWithType:(DFTransitionAnimationType)type andTransitonContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)spreadBackWithType:(DFTransitionAnimationType)type andTransitonContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)pointSpreadNextWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)pointSpreadBackWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
