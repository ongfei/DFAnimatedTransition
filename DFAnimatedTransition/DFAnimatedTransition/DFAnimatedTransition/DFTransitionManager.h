//
//  DFTransitionManager.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/29.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DFTransitionConfigType.h"

@interface DFTransitionManager : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) UIView *startView;
@property (nonatomic, weak) UIView *targetView;

@property (nonatomic, assign) BOOL isSysBackAnimation;
@property (nonatomic, assign) NSTimeInterval animationTime;
//动作枚举
@property (nonatomic, assign) DFTransitionType transitionType;
//动画类型
@property (nonatomic, assign) DFTransitionAnimationType animationType;
//完成回掉
@property (nonatomic, copy) void(^completionBlock)(void);
//交互完成回掉
@property (nonatomic, copy) void(^willEndInteractiveBlock)(BOOL success);


+(DFTransitionManager *)copyPropertyFromObjcet:(id)object toObjcet:(id)targetObjcet;
- (UIImage *)imageFromView:(UIView *)view atFrame:(CGRect)rect;
@end
