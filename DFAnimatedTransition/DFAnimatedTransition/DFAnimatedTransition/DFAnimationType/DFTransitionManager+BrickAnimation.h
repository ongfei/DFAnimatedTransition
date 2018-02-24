//
//  DFTransitionManager+BrickAnimation.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager.h"

@interface DFTransitionManager (BrickAnimation)

- (void)brickOpenNextWithType:(DFTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)brickOpenBackWithType:(DFTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)brickCloseNextWithType:(DFTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)brickCloseBackWithType:(DFTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
