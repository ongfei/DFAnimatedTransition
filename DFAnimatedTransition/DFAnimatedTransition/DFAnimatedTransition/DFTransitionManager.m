//
//  DFTransitionManager.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/29.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "DFTransitionManager+TypeHelper.h"
#import "DFAnimationProperty.h"
#import "DFTransitionManager+BoomAnimation.h"
#import "DFTransitionManager+PageAnimation.h"
#import "DFTransitionManager+InsideThenPushAnimation.h"
#import "DFTransitionManager+ViewMoveAnimation.h"
#import "DFTransitionManager+SpreadAnimation.h"
#import "DFTransitionManager+BrickAnimation.h"
#import "DFTransitionManager+CoverAnimation.h"
#import "DFTransitionManager+FragmentAnimation.h"
#import "DFTransitionManager+FlipAnimation.h"


@interface DFTransitionManager ()

@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation DFTransitionManager

//返回动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return _animationTime ;
}
- (void)animationEnded:(BOOL) transitionCompleted {
    
    if (transitionCompleted) {
        [self removeDelegate];
    }
    UIViewController *toVC = [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    if (toVC.navigationController.navigationBar && self.autoShowAndHideNavBar) {
//        [UIView animateWithDuration:0.2 animations:^{
//            toVC.navigationController.navigationBar.alpha = 1.0;
//        }];
//    }
    
}
 //所有的过渡动画事务都在这个方法里面完成
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    _transitionContext = transitionContext;
    
    //设置默认动画样式
    if(self.animationType == DFTransitionAnimationTypeDefault) {
        self.animationType = DFTransitionAnimationTypeSysFade;
    }
    
    switch (self.transitionType) {
        //推动画一致 ， 拉动画一致
        case DFTransitionTypePresent:
        case DFTransitonTypePush:
            
            [self shoveTransitionAnimation:transitionContext withAnimationType:self.animationType];
            
            break;
            
        case DFTransitonTypeDismiss:
        case DFTransitonTypePop:
            
            [self pullTransitionAnimation:transitionContext withAnimationType:self.animationType];
            
            break;
            
        default:
            break;
    }
}

//push & present 动画
-(void)shoveTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(DFTransitionAnimationType)animationType {
    //系统动画
    if (animationType < DFTransitionAnimationTypeDefault) {
        
        [self sys_shoveTransitionAnimation:transitionContext withAnimationType:animationType];
        
    }else {
//  自定义
        unsigned int count = 0;
        Method *methodlist = class_copyMethodList([DFTransitionManager class], &count);
        int tag = 0;
        for (int i = 0; i < count; i++) {
            Method method = methodlist[i];
            SEL selector = method_getName(method);
            NSString *methodName = NSStringFromSelector(selector);
            if ([methodName rangeOfString:@"NextTransitionAnimation"].location != NSNotFound) {
                tag++;
                if (tag == animationType - DFTransitionAnimationTypeDefault) {
                    ((void (*)(id,SEL,id<UIViewControllerContextTransitioning>,DFTransitionAnimationType))objc_msgSend)(self,selector,transitionContext,animationType);
                    break;
                }
                
            }
        }
        free(methodlist);

    }
}

//pop & dismiss 动画
-(void)pullTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(DFTransitionAnimationType)animationType {
    
    //系统动画
    if (animationType < DFTransitionAnimationTypeDefault) {
        
        [self sys_pullTransitionAnimation:transitionContext withAnimationType:animationType];
        
    }else {
        //  自定义
        unsigned int count = 0;
        Method *methodlist = class_copyMethodList([DFTransitionManager class], &count);
        int tag= 0;
        for (int i = 0; i < count; i++) {
            Method method = methodlist[i];
            SEL selector = method_getName(method);
            NSString *methodName = NSStringFromSelector(selector);
            if ([methodName rangeOfString:@"BackTransitionAnimation"].location != NSNotFound) {
                tag++;
                if (tag == animationType - DFTransitionAnimationTypeDefault) {
                    ((void (*)(id,SEL,id<UIViewControllerContextTransitioning>,DFTransitionAnimationType))objc_msgSend)(self,selector,transitionContext,animationType);
                    break;
                }
                
            }
        }
        free(methodlist);

    }
    
}

// *********************************************************************************************
-(void)pageNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self pageTransitionNextAnimationWithContext:transitionContext];
}
-(void)pageBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self pageTransitionBackAnimationWithContext:transitionContext];
}


// *********************************************************************************************
-(void)viewMoveNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveNextWithType:DFTransitionAnimationTypeViewMoveToNextVC andContext:transitionContext];
}
-(void)viewMoveBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveBackWithType:DFTransitionAnimationTypeViewMoveToNextVC andContext:transitionContext];
}
-(void)viewMoveNormalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveNextWithType:DFTransitionAnimationTypeViewMoveNormalToNextVC andContext:transitionContext];
}
-(void)viewMoveNormalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveBackWithType:DFTransitionAnimationTypeViewMoveNormalToNextVC andContext:transitionContext];
}


// *********************************************************************************************
-(void)coverNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self coverTransitionNextAnimationWithContext:transitionContext];
}
-(void)coverBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self coverTransitionBackAnimationWithContext:transitionContext];
}



// *********************************************************************************************
-(void)spreadFromRightNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:DFTransitionAnimationTypeSpreadFromRight andTransitonContext:transitionContext];
}
-(void)spreadFromRightBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:DFTransitionAnimationTypeSpreadFromRight andTransitonContext:transitionContext];
}
-(void)spreadFromLeftNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:DFTransitionAnimationTypeSpreadFromLeft andTransitonContext:transitionContext];
}
-(void)spreadFromLeftBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:DFTransitionAnimationTypeSpreadFromLeft andTransitonContext:transitionContext];
}
-(void)spreadFromTopNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:DFTransitionAnimationTypeSpreadFromTop andTransitonContext:transitionContext];
}
-(void)spreadFromTopBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:DFTransitionAnimationTypeSpreadFromTop andTransitonContext:transitionContext];
}
-(void)spreadFromBottomNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:DFTransitionAnimationTypeSpreadFromBottom andTransitonContext:transitionContext];
}
-(void)spreadFromBottomBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:DFTransitionAnimationTypeSpreadFromBottom andTransitonContext:transitionContext];
}
-(void)pointSpreadPresentNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self pointSpreadNextWithContext:transitionContext];
}
-(void)pointSpreadPresentBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self pointSpreadBackWithContext:transitionContext];
}


// *********************************************************************************************
-(void)boomPresentNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self boomPresentTransitionNextAnimation:transitionContext];
}
-(void)boomPresentBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self boomPresentTransitionBackAnimation:transitionContext];
}


// *********************************************************************************************
-(void)brickOpenVerticalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickOpenNextWithType:DFTransitionAnimationTypeBrickOpenVertical andTransitionContext:transitionContext];
}
-(void)brickOpenVerticalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickOpenBackWithType:DFTransitionAnimationTypeBrickOpenVertical andTransitionContext:transitionContext];
}
-(void)brickOpenHorizontalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickOpenNextWithType:DFTransitionAnimationTypeBrickOpenHorizontal andTransitionContext:transitionContext];
}
-(void)brickOpenHorizontalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickOpenBackWithType:DFTransitionAnimationTypeBrickOpenHorizontal andTransitionContext:transitionContext];
}
-(void)brickCloseVerticalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickCloseNextWithType:DFTransitionAnimationTypeBrickCloseVertical andTransitionContext:transitionContext];
}
-(void)brickCloseVerticalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickCloseBackWithType:DFTransitionAnimationTypeBrickCloseVertical andTransitionContext:transitionContext];
}
-(void)brickCloseHorizontalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickCloseNextWithType:DFTransitionAnimationTypeBrickCloseHorizontal andTransitionContext:transitionContext];
}
-(void)brickCloseHorizontalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickCloseBackWithType:DFTransitionAnimationTypeBrickCloseHorizontal andTransitionContext:transitionContext];
}


// *********************************************************************************************
-(void)insideThenPushNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self insideThenPushNextAnimationWithContext:transitionContext];
}
-(void)insideThenPushBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self insideThenPushBackAnimationWithContext:transitionContext];
}



// *********************************************************************************************
-(void)fragmentShowFromRightNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:DFTransitionAnimationTypeFragmentShowFromRight andContext:transitionContext];
}
-(void)fragmentShowFromRightBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:DFTransitionAnimationTypeFragmentShowFromRight andContext:transitionContext];
}
-(void)fragmentShowFromLeftNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:DFTransitionAnimationTypeFragmentShowFromLeft andContext:transitionContext];
}
-(void)fragmentShowFromLeftBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:DFTransitionAnimationTypeFragmentShowFromLeft andContext:transitionContext];
}
-(void)fragmentShowFromTopNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:DFTransitionAnimationTypeFragmentShowFromTop andContext:transitionContext];
}
-(void)fragmentShowFromTopBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:DFTransitionAnimationTypeFragmentShowFromTop andContext:transitionContext];
}
-(void)fragmentShowFromBottomNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:DFTransitionAnimationTypeFragmentShowFromBottom andContext:transitionContext];
}
-(void)fragmentShowFromBottomBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:DFTransitionAnimationTypeFragmentShowFromBottom andContext:transitionContext];
}
-(void)fragmentHideFromRightNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:DFTransitionAnimationTypeFragmentHideFromRight andContext:transitionContext];
}
-(void)fragmentHideFromRightBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:DFTransitionAnimationTypeFragmentHideFromRight andContext:transitionContext];
}
-(void)fragmentHideFromLefttNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:DFTransitionAnimationTypeFragmentHideFromLeft andContext:transitionContext];
}
-(void)fragmentHideFromLeftBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:DFTransitionAnimationTypeFragmentHideFromLeft andContext:transitionContext];
}
-(void)fragmentHideFromTopNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:DFTransitionAnimationTypeFragmentHideFromTop andContext:transitionContext];
}
-(void)fragmentHideFromTopBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:DFTransitionAnimationTypeFragmentHideFromTop andContext:transitionContext];
}
-(void)fragmentHideFromBottomNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:DFTransitionAnimationTypeFragmentHideFromBottom andContext:transitionContext];
}
-(void)fragmentHideFromBottomBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:DFTransitionAnimationTypeFragmentHideFromBottom andContext:transitionContext];
}
-(void)tipFlipNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self tipFlipToNextAnimationContext:transitionContext];
}

-(void)tipFlipBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self tipFlipBackAnimationContext:transitionContext];
}

//系统动画
-(void)sys_shoveTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(DFTransitionAnimationType)animationType {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //截图view
    UIView *tempView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    
    UIView *temView1 = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    [containerView bringSubviewToFront:fromVC.view];
    [containerView bringSubviewToFront:toVC.view];
    
    CATransition *tranAnimation = [self getSysTransitionWithType:animationType];
    [containerView.layer addAnimation:tranAnimation forKey:nil];
    
    self.completionBlock = ^(){
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
        }
        [tempView removeFromSuperview];
        [temView1 removeFromSuperview];
        
    };
    
}

-(void)sys_pullTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(DFTransitionAnimationType)animationType {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *tempView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    
    UIView *temView1 = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    CATransition *tranAnimation = [self getSysTransitionWithType:animationType];
    [containerView.layer addAnimation:tranAnimation forKey:nil];
    
    __weak UIViewController * weakToVC = toVC;
    self.completionBlock = ^(){
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
        }
        weakToVC.view.hidden = NO;
        
        [tempView removeFromSuperview];
        [temView1 removeFromSuperview];
    };
    
    
    self.willEndInteractiveBlock = ^(BOOL success) {
        if (success) {
            weakToVC.view.hidden = NO;
        }else{
            weakToVC.view.hidden = YES;
            [tempView removeFromSuperview];
            [temView1 removeFromSuperview];
        }
        
    };
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (flag) {
        _completionBlock ? _completionBlock() : nil;
        _completionBlock = nil;
    }
    
}
- (void)removeDelegate {
    
    UIViewController *fromVC = [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    void (^RemoveDelegateBlock)(void) = ^(){
        
        fromVC.transitioningDelegate = nil;
        fromVC.navigationController.delegate = nil;
        toVC.transitioningDelegate = nil;
        toVC.navigationController.delegate = nil;
        
    };
    
    switch (self.transitionType) {
        case DFTransitonTypePush:
        case DFTransitionTypePresent:{ //Next
            if (self.isSysBackAnimation) {
                RemoveDelegateBlock ? RemoveDelegateBlock() : nil;
            }
        }
            break;
        default:{ //Back
            RemoveDelegateBlock ? RemoveDelegateBlock() : nil;
        }
            break;
    }
    
}
+(DFTransitionManager *)copyPropertyFromObjcet:(id)object toObjcet:(id)targetObjcet {
    
    DFAnimationProperty *propery = object;
    DFTransitionManager *transition = targetObjcet;
    
    transition.animationTime = propery.animationTime;
    transition.transitionType = propery.transitionType;
    transition.animationType = propery.animationType;
//    transition.isSysBackAnimation = propery.isSysBackAnimation;
//    transition.backGestureType = propery.backGestureType;
//    transition.backGestureEnable = propery.backGestureEnable;
    transition.startView = propery.startView;
    transition.targetView = propery.targetView;
//    transition.autoShowAndHideNavBar = propery.autoShowAndHideNavBar;
    
    return transition;
    
}
- (UIImage *)imageFromView: (UIView *)view atFrame:(CGRect)rect{
    
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  theImage;
    
}

@end
