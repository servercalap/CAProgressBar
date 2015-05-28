//
//  CAProgressBar.m
//  CAProgressBar
//
//  Created by Server CALAP on 20/04/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import "CAProgressBar.h"

#define kShowHideAnimationDuration 0.3


@implementation CAProgressBar{


    NSMutableArray *hudRects;
}

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self prepareUI];
        self.userInteractionEnabled = NO;
        self.alpha = 0;
    }
    return self;
}

#pragma mark - prepareUI


-(void)prepareUI{

    self.backgroundColor = [UIColor clearColor];
    
        UIView * rect1 = [self drawRectPosition:CGPointMake(-120, 0)];
        UIView * rect2 = [self drawRectPosition:CGPointMake(-65, 0)];
        UIView * rect3 = [self drawRectPosition:CGPointMake(-10, 0)];
        UIView * rect4 = [self drawRectPosition:CGPointMake(45, 0)];
        UIView * rect5 = [self drawRectPosition:CGPointMake(100, 0)];
    
    [self addSubview:rect1];
    [self addSubview:rect2];
    [self addSubview:rect3];
    [self addSubview:rect4];
    [self addSubview:rect5];
    [self doAnimateCycleWithRects:@[rect1,rect2,rect3,rect4,rect5]];//,rect2,rect3,rect4,rect5
}

-(void)doAnimateCycleWithRects:(NSArray*)rects{
    
    __weak typeof(self)wSelf = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25*0.5*NSEC_PER_SEC)),
                   dispatch_get_main_queue() ,^{
                       [wSelf animateRect:rects[0]withDuration:0.30];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25*0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [wSelf animateRect:rects[1]withDuration:0.25];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25*0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [wSelf animateRect:rects[2]withDuration:0.20];
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25*0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [wSelf animateRect:rects[3]withDuration:0.15];
                   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25*0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [wSelf animateRect:rects[4]withDuration:0.10];
                        
                            });
                        });
                    });
                });
            });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [wSelf doAnimateCycleWithRects:rects];
    });

}

-(void)animateRect:(UIView*)rect withDuration:(NSTimeInterval)duration{

    [rect setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    
    [UIView animateWithDuration:duration animations:^{
        rect.alpha =1;
        rect.transform = CGAffineTransformMakeScale(1, 1.2);
           }
                     completion:^(BOOL finished) {
                        [UIView animateWithDuration:duration animations:^{
                            rect.alpha = 0.5;
                            rect.transform = CGAffineTransformMakeScale(1, 1);
                        } completion:^(BOOL finished) {
                            
                        }];
                     }];

}


- (UIView *)drawRectPosition:(CGPoint)positionPoint{

    UIView * rect = [UIView new];
    
    CGRect rectFrame;
    
    rectFrame.size.width = 50;
    rectFrame.size.height = 15;
    rectFrame.origin.x = positionPoint.x;
    rectFrame.origin.y = 0;
    rect.frame = rectFrame;
    
    rect.backgroundColor = [UIColor redColor];
    rect.alpha = 0.5;
    rect.layer.cornerRadius = 3;
    
    if (hudRects ==nil) {
        hudRects = [NSMutableArray new];
    }
    
    [hudRects addObject:rect];
    return rect;
}

#pragma mark - Setters

-(void)setHudColor:(UIColor *)hudColor{

    for (UIView *rect in hudRects) {
        rect.backgroundColor = hudColor;
    }

}


#pragma mark - show/hide

-(void)hide:(BOOL)animated{

    [UIView animateWithDuration:kShowHideAnimationDuration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)show:(BOOL)animated{

    if (animated) {
        [UIView animateWithDuration:kShowHideAnimationDuration animations:^{
            self.alpha = 1;
        }];
        }else{
            self.alpha =1 ;
        }

}

-(void)dealloc{
    hudRects = nil;
}
@end
