//
//  DFTransitionManager+ViewMoveAnimation.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager.h"

@interface DFTransitionManager (ViewMoveAnimation)

- (void)viewMoveNextWithType:(DFTransitionAnimationType )type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)viewMoveBackWithType:(DFTransitionAnimationType )type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
