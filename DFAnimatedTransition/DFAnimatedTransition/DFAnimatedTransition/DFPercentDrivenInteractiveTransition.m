//
//  DFPercentDrivenInteractiveTransition.m
//  DFAnimatedTransition
//
//  Created by ongfei on 2017/9/29.
//  Copyright © 2017年 ongfei. All rights reserved.
//

#import "DFPercentDrivenInteractiveTransition.h"

@interface DFPercentDrivenInteractiveTransition ()

@property (nonatomic, assign) BOOL isInter;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CGFloat percent;
@property (nonatomic, strong) UIViewController *vc;

@end

@implementation DFPercentDrivenInteractiveTransition
- (void)addGestureToViewController:(UIViewController *)vc {
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    self.vc = vc;
    [vc.view addGestureRecognizer:pan];
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    _percent = 0.0;
    CGFloat totalWidth = pan.view.bounds.size.width;
    CGFloat totalHeight = pan.view.bounds.size.height;
    switch (self.getstureType) {
            
        case DFGestureLeft:{
            CGFloat x = [pan translationInView:pan.view].x;
            _percent = -x/totalWidth;
        }
            break;
        case DFGestureRight:{
            CGFloat x = [pan translationInView:pan.view].x;
            _percent = x/totalWidth;
        }
            break;
        case DFGestureBottom:{
            
            CGFloat y = [pan translationInView:pan.view].y;
            _percent = y/totalHeight;
            
        }
            break;
        case DFGestureTop:{
            CGFloat y = [pan translationInView:pan.view].y;
            _percent = -y/totalHeight;
        }
            
        default:
            break;
    }
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:{
            _isInter = YES;
            [self beganGesture];
        }
            break;
        case UIGestureRecognizerStateChanged:{
            [self updateInteractiveTransition:_percent];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            _isInter = NO;
            
            [self continueAction];
            
        }
            break;
        default:
            break;
    }
}



- (void)beganGesture {
    
    switch (_transitionType) {
        case DFTransitionTypePresent:{
            _presentBlock? _presentBlock() : nil;
        }
            break;
        case DFTransitonTypeDismiss:{
            _dismissBlock ? _dismissBlock() : [_vc dismissViewControllerAnimated:YES completion:^{
            }];
        }
            break;
        case DFTransitonTypePush: {
            _pushBlock ? _pushBlock() : nil;
        }
            break;
        case DFTransitonTypePop:{
            _popBlock ? _popBlock() : [_vc.navigationController popViewControllerAnimated:YES];
            
        }
            break;
        default:
            break;
    }
    
}

- (BOOL)isInteractive {
    return _isInter;
}

- (void)continueAction {
    if (_displayLink) {
        return;
    }
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(UIChange)];
    [_displayLink  addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)UIChange {
    
    CGFloat timeDistance = 2.0/60;
    if (_percent > 0.4) {
        _percent += timeDistance;
    }else {
        _percent -= timeDistance;
    }
    [self updateInteractiveTransition:_percent];
    
    if (_percent >= 1.0) {
        
        _willEndInteractiveBlock ? _willEndInteractiveBlock(YES) : nil;
        [self finishInteractiveTransition];
        [_displayLink invalidate];
        _displayLink = nil;
    }
    
    if (_percent <= 0.0) {
        
        _willEndInteractiveBlock ? _willEndInteractiveBlock(NO) : nil;
        
        [_displayLink invalidate];
        _displayLink = nil;
        [self cancelInteractiveTransition];
    }
}

@end
