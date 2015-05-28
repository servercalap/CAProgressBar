//
//  ViewController.h
//  CAProgressBar
//
//  Created by Server CALAP on 20/04/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAProgressBar.h"

@interface ViewController : UIViewController



- (IBAction)stopAnim:(UIButton *)sender;

- (IBAction)action:(UIButton *)sender;
@property(strong,nonatomic)CAProgressBar * checkProgress;
@end

