//
//  DFTransitionManager+FragmentAnimation.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager.h"

@interface DFTransitionManager (FragmentAnimation)

-(void)fragmentShowNextType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)fragmentShowBackType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)fragmentHideNextType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)fragmentHideBackType:(DFTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
