//
//  CAProgressBar.h
//  CAProgressBar
//
//  Created by Server CALAP on 20/04/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAProgressBar : UIView


@property(strong,nonatomic) UIColor * hudColor;


-(void)hide:(BOOL)animated;
-(void)show:(BOOL)animated;


@end
