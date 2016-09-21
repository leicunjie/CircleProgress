//
//  ViewController.m
//  CircleProgress
//
//  Created by leicunjie on 16/9/21.
//  Copyright © 2016年 leicunjie. All rights reserved.
//

#import "ViewController.h"
#import "CCCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadProgressCircle];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadProgressCircle {
    CCCircleView *circle = [[CCCircleView alloc]initWithFrame:CGRectMake(50, 200, 200, 200)];
    circle.progress = 0.8;
    [self.view addSubview:circle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
