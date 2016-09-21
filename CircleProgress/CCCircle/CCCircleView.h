//
//  CCCircleView.h
//  TBCycleProgress
//
//  Created by leicunjie on 16/8/19.
//  Copyright © 2016年 SF. All rights reserved.
//

/*
 CCCircleView *circle = [[CCCircleView alloc]initWithFrame:CGRectMake(50, 400, 200, 200)];
 circle.progress = 0.5;
 [self.view addSubview:circle];
 */

#import <UIKit/UIKit.h>

@interface CCCircleView : UIView

//设置进度 范围0~1.0
@property(nonatomic, assign) double progress;

@end
