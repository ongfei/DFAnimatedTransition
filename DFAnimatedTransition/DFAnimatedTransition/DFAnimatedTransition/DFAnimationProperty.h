//
//  DFAnimationProperty.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DFTransitionConfigType.h"

@interface DFAnimationProperty : NSObject
/**
 *  转场动画时间
 *
 *  transitiion animation time
 */
@property (nonatomic, assign) NSTimeInterval animationTime;

/**
 *  转场方式 ：push,pop,present,dismiss
 *
 *  transitiion type ：push,pop,present,dismiss
 */
@property (nonatomic, assign) DFTransitionType transitionType;

/**
 *  转场动画类型
 *
 *  transitiion animation type
 */
@property (nonatomic, assign) DFTransitionAnimationType animationType;

/**
 *  View move 等动画中指定的起始视图
 *
 */
@property (nonatomic, strong) UIView *startView;
/**
 *  View move 等动画中指定的结束视图
 *
 */
@property (nonatomic, strong) UIView *targetView;
@end
