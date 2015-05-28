//
//  ViewController.m
//  CAProgressBar
//
//  Created by Server CALAP on 20/04/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import "ViewController.h"
#import "CAProgressBar.h"



#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    

    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0x34465C);
    
 _checkProgress = [[CAProgressBar alloc] initWithFrame:CGRectMake((CGFloat) ((self.view.frame.size.width - 30) * 0.5),
                                                                           (CGFloat) ((self.view.frame.size.height-50)), 55, 20)];
    _checkProgress.hudColor = UIColorFromRGB(0xF1F2F3);
    [self.view addSubview:_checkProgress];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)action:(UIButton *)sender {
    

    [_checkProgress show:YES];
}
- (IBAction)stopAnim:(UIButton *)sender{}
@end
