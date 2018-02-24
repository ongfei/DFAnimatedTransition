//
//  DFTransitionManager+FlipAnimation.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager.h"

@interface DFTransitionManager (FlipAnimation)

- (void)tipFlipToNextAnimationContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)tipFlipBackAnimationContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
