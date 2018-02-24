//
//  DFTransitionManager+TypeHelper.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager.h"

@interface DFTransitionManager (TypeHelper)<CAAnimationDelegate>
//转换系统类型
- (CATransition *)getSysTransitionWithType:(DFTransitionAnimationType)animationType;

@end
