//
//  DFTransitionManager+TypeHelper.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/30.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFTransitionManager+TypeHelper.h"

@implementation DFTransitionManager (TypeHelper)

- (CATransition *)getSysTransitionWithType:(DFTransitionAnimationType)animationType {
    
    CATransition *tranAnimation = [CATransition animation];
    
    tranAnimation.duration =  self.animationTime;
    
    tranAnimation.delegate  =  self;
    
    switch (animationType) {
        case DFTransitionAnimationTypeSysFade:{
            tranAnimation.type = kCATransitionFade;
        }
            break;
        case DFTransitionAnimationTypeSysPushFromRight:{
            tranAnimation.type  =  kCATransitionPush;
            tranAnimation.subtype = kCATransitionFromRight;
        }
            break;
        case DFTransitionAnimationTypeSysPushFromLeft:{
            tranAnimation.type  =  kCATransitionPush;
            tranAnimation.subtype = kCATransitionFromLeft;
        }
            break;
        case DFTransitionAnimationTypeSysPushFromTop:{
            tranAnimation.type  =  kCATransitionPush;
            tranAnimation.subtype = kCATransitionFromTop;
        }
            break;
        case DFTransitionAnimationTypeSysPushFromBottom:{
            tranAnimation.type  =  kCATransitionPush;
            tranAnimation.subtype = kCATransitionFromBottom;
            
        }
            break;
        case DFTransitionAnimationTypeSysRevealFromRight:{
            tranAnimation.type  =  kCATransitionReveal;
            tranAnimation.subtype = kCATransitionFromRight;
        }
            break;
        case DFTransitionAnimationTypeSysRevealFromLeft:{
            tranAnimation.type  =  kCATransitionReveal;
            tranAnimation.subtype = kCATransitionFromLeft;
        }
            break;
        case DFTransitionAnimationTypeSysRevealFromTop:{
            tranAnimation.type  =  kCATransitionReveal;
            tranAnimation.subtype = kCATransitionFromTop;
        }
            break;
        case DFTransitionAnimationTypeSysRevealFromBottom:{
            tranAnimation.type  =  kCATransitionReveal;
            tranAnimation.subtype = kCATransitionFromBottom;
        }
            break;
        case DFTransitionAnimationTypeSysMoveInFromRight:{
            tranAnimation.type  =  kCATransitionMoveIn;
            tranAnimation.subtype = kCATransitionFromRight;
        }
            break;
        case DFTransitionAnimationTypeSysMoveInFromLeft:{
            tranAnimation.type  =  kCATransitionMoveIn;
            tranAnimation.subtype = kCATransitionFromLeft;
        }
            break;
        case DFTransitionAnimationTypeSysMoveInFromTop:{
            tranAnimation.type  =  kCATransitionMoveIn;
            tranAnimation.subtype = kCATransitionFromTop;
        }
            break;
        case DFTransitionAnimationTypeSysMoveInFromBottom:{
            tranAnimation.type  =  kCATransitionMoveIn;
            tranAnimation.subtype = kCATransitionFromBottom;
        }
            break;
        case DFTransitionAnimationTypeSysCubeFromRight:{
            tranAnimation.type  =  @"cube";
            tranAnimation.subtype = kCATransitionFromRight;
        }
            break;
        case DFTransitionAnimationTypeSysCubeFromLeft:{
            tranAnimation.type  =  @"cube";
            tranAnimation.subtype = kCATransitionFromLeft;
        }
            break;
        case DFTransitionAnimationTypeSysCubeFromTop:{
            tranAnimation.type = @"cube";
            tranAnimation.subtype = kCATransitionFromTop;
        }
            break;
        case DFTransitionAnimationTypeSysCubeFromBottom:{
            tranAnimation.type = @"cube";
            tranAnimation.subtype = kCATransitionFromBottom;
        }
            break;
        case DFTransitionAnimationTypeSysSuckEffect:{
            tranAnimation.type = @"suckEffect";
        }
            break;
        case DFTransitionAnimationTypeSysOglFlipFromRight:{
            tranAnimation.type = @"oglFlip";
            tranAnimation.subtype = kCATransitionFromRight;
        }
            break;
        case DFTransitionAnimationTypeSysOglFlipFromLeft:{
            tranAnimation.type = @"oglFlip";
            tranAnimation.subtype = kCATransitionFromLeft;
        }
            break;
        case DFTransitionAnimationTypeSysOglFlipFromTop:{
            tranAnimation.type = @"oglFlip";
            tranAnimation.subtype = kCATransitionFromTop;
        }
            break;
        case DFTransitionAnimationTypeSysOglFlipFromBottom:{
            tranAnimation.type = @"oglFlip";
            tranAnimation.subtype = kCATransitionFromBottom;
        }
            break;
        case DFTransitionAnimationTypeSysRippleEffect:{
            tranAnimation.type = @"rippleEffect";
        }
            break;
        case DFTransitionAnimationTypeSysPageCurlFromRight:{
            tranAnimation.type = @"pageCurl";
            tranAnimation.subtype = kCATransitionFromRight;
        }
            break;
        case DFTransitionAnimationTypeSysPageCurlFromLeft:{
            tranAnimation.type = @"pageCurl";
            tranAnimation.subtype = kCATransitionFromLeft;
        }
            break;
        case DFTransitionAnimationTypeSysPageCurlFromTop:{
            tranAnimation.type = @"pageCurl";
            tranAnimation.subtype = kCATransitionFromTop;
        }
            break;
        case DFTransitionAnimationTypeSysPageCurlFromBottom:{
            tranAnimation.type = @"pageCurl";
            tranAnimation.subtype = kCATransitionFromBottom;
        }
            break;
        case DFTransitionAnimationTypeSysPageUnCurlFromRight:{
            tranAnimation.type = @"pageUnCurl";
            tranAnimation.subtype = kCATransitionFromRight;
        }
            break;
        case DFTransitionAnimationTypeSysPageUnCurlFromLeft:{
            tranAnimation.type = @"pageUnCurl";
            tranAnimation.subtype = kCATransitionFromLeft;
        }
            break;
        case DFTransitionAnimationTypeSysPageUnCurlFromTop:{
            tranAnimation.type = @"pageUnCurl";
            tranAnimation.subtype = kCATransitionFromTop;
        }
            break;
        case DFTransitionAnimationTypeSysPageUnCurlFromBottom:{
            tranAnimation.type = @"pageUnCurl";
            tranAnimation.subtype = kCATransitionFromBottom;
        }
            break;
        case DFTransitionAnimationTypeSysCameraIrisHollowOpen:{
            tranAnimation.type = @"cameraIrisHollowOpen";
        }
            break;
        case DFTransitionAnimationTypeSysCameraIrisHollowClose:{
            tranAnimation.type = @"cameraIrisHollowClose";
        }
            break;
        default:
            break;
    }
    return tranAnimation;
}
@end
