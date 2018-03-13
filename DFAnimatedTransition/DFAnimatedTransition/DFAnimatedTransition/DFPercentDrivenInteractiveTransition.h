//
//  DFPercentDrivenInteractiveTransition.h
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/29.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFTransitionConfigType.h"

typedef void(^ActionBlock)(void);

//主要用来处理手势
@interface DFPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) DFGestureType getstureType;
@property (readonly, assign, nonatomic) BOOL isInteractive;
@property (nonatomic, assign) DFTransitionType transitionType;

@property (nonatomic, copy) ActionBlock presentBlock;
@property (nonatomic, copy) ActionBlock pushBlock;
@property (nonatomic, copy) ActionBlock dismissBlock;
@property (nonatomic, copy) ActionBlock popBlock;

@property (nonatomic, copy) void(^willEndInteractiveBlock)(BOOL success);

- (void)addGestureToViewController:(UIViewController *)vc;

@end
