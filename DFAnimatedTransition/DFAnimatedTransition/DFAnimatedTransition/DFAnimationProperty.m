//
//  DFAnimationProperty.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFAnimationProperty.h"


@implementation DFAnimationProperty

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _animationTime = 0.400082;
        
        self.animationType = DFTransitionAnimationTypeDefault;
        
    }
    
    return self;
}

@end
