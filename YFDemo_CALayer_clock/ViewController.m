//
//  ViewController.m
//  YFDemo_CALayer_clock
//
//  Created by 亚飞 on 2018/6/4.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "ViewController.h"
#import "YFClockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    YFClockView *clockView = [[YFClockView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:clockView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
