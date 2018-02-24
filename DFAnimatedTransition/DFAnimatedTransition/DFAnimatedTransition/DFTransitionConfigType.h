//
//  DFTransitionConfigType.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/29.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#ifndef DFTransitionConfigType_h
#define DFTransitionConfigType_h

/*
 * 动作类型
 */
typedef enum : NSUInteger {
    DFTransitionTypePresent,
    DFTransitonTypeDismiss,
    DFTransitonTypePush,
    DFTransitonTypePop,
} DFTransitionType;

/*
 * 手势类型
 */
typedef NS_ENUM(NSUInteger, DFGestureType) {
    DFGestureNone,
    DFGestureTop,
    DFGestureLeft,
    DFGestureBottom,
    DFGestureRight,
};

/*
 * 动画类型
 */
typedef enum : NSUInteger {
    //----------- 系统 ------------
    DFTransitionAnimationTypeSysFade = 1,                   //淡入淡出
    
    DFTransitionAnimationTypeSysPushFromRight,
    DFTransitionAnimationTypeSysPushFromLeft,
    DFTransitionAnimationTypeSysPushFromTop,
    DFTransitionAnimationTypeSysPushFromBottom,//Push
    
    DFTransitionAnimationTypeSysRevealFromRight,
    DFTransitionAnimationTypeSysRevealFromLeft,
    DFTransitionAnimationTypeSysRevealFromTop,
    DFTransitionAnimationTypeSysRevealFromBottom,//揭开
    
    DFTransitionAnimationTypeSysMoveInFromRight,
    DFTransitionAnimationTypeSysMoveInFromLeft,
    DFTransitionAnimationTypeSysMoveInFromTop,
    DFTransitionAnimationTypeSysMoveInFromBottom,//覆盖
    
    DFTransitionAnimationTypeSysCubeFromRight,
    DFTransitionAnimationTypeSysCubeFromLeft,
    DFTransitionAnimationTypeSysCubeFromTop,
    DFTransitionAnimationTypeSysCubeFromBottom,//立方体
    
    DFTransitionAnimationTypeSysSuckEffect,                 //吮吸
    
    DFTransitionAnimationTypeSysOglFlipFromRight,
    DFTransitionAnimationTypeSysOglFlipFromLeft,
    DFTransitionAnimationTypeSysOglFlipFromTop,
    DFTransitionAnimationTypeSysOglFlipFromBottom, //翻转
    
    DFTransitionAnimationTypeSysRippleEffect,               //波纹
    
    DFTransitionAnimationTypeSysPageCurlFromRight,
    DFTransitionAnimationTypeSysPageCurlFromLeft,
    DFTransitionAnimationTypeSysPageCurlFromTop,
    DFTransitionAnimationTypeSysPageCurlFromBottom,//翻页
    
    DFTransitionAnimationTypeSysPageUnCurlFromRight,
    DFTransitionAnimationTypeSysPageUnCurlFromLeft,
    DFTransitionAnimationTypeSysPageUnCurlFromTop,
    DFTransitionAnimationTypeSysPageUnCurlFromBottom,//反翻页
    
    DFTransitionAnimationTypeSysCameraIrisHollowOpen,       //开镜头
    
    DFTransitionAnimationTypeSysCameraIrisHollowClose,      //关镜头
    
    //----------- 自定义 ------------
    DFTransitionAnimationTypeDefault,
    
    DFTransitionAnimationTypePageTransition,
    
    DFTransitionAnimationTypeViewMoveToNextVC,
    DFTransitionAnimationTypeViewMoveNormalToNextVC,
    
    DFTransitionAnimationTypeCover,
    
    DFTransitionAnimationTypeSpreadFromRight,
    DFTransitionAnimationTypeSpreadFromLeft,
    DFTransitionAnimationTypeSpreadFromTop,
    DFTransitionAnimationTypeSpreadFromBottom,
    DFTransitionAnimationTypePointSpreadPresent,
    
    DFTransitionAnimationTypeBoom,
    
    DFTransitionAnimationTypeBrickOpenVertical,
    DFTransitionAnimationTypeBrickOpenHorizontal,
    DFTransitionAnimationTypeBrickCloseVertical,
    DFTransitionAnimationTypeBrickCloseHorizontal,
    
    DFTransitionAnimationTypeInsideThenPush,
    
    DFTransitionAnimationTypeFragmentShowFromRight,
    DFTransitionAnimationTypeFragmentShowFromLeft,
    DFTransitionAnimationTypeFragmentShowFromTop,
    DFTransitionAnimationTypeFragmentShowFromBottom,
    
    DFTransitionAnimationTypeFragmentHideFromRight,
    DFTransitionAnimationTypeFragmentHideFromLeft,
    DFTransitionAnimationTypeFragmentHideFromTop,
    DFTransitionAnimationTypeFragmentHideFromBottom,
    DFTransitionAnimationTypeTipFlip,
    
} DFTransitionAnimationType;


#endif /* DFTransitionConfigType_h */
