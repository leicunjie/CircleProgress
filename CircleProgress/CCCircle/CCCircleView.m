//
//  CCCircleView.m
//  TBCycleProgress
//
//  Created by leicunjie on 16/8/19.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "CCCircleView.h"

#define GreenColor [UIColor colorWithRed:98/255.0 green:200/255.0 blue:166/255.0 alpha:1]

@interface CCCircleView()
@property(nonatomic, strong) UILabel *labProgress;
//绿色的layer
@property(nonatomic, strong) CAShapeLayer *progressLayer;
//灰色的layer
@property(nonatomic, strong) CAShapeLayer *grayProgressLayer;
@end


@implementation CCCircleView
{
    float _p;
    NSTimer *_timer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         [self drawProgressCircleWithEndAngle:-M_PI_2 + M_PI * 2 isGrayCircle:YES];
    }
    return self;
}

- (void)setProgress:(double)progress {
    _progress = progress;
    self.labProgress.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
    [self performSelector:@selector(delay) withObject:nil afterDelay:1];
}

- (void)delay {
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.020 target:self selector:@selector(drawProgress) userInfo:nil repeats:YES];
}

- (void)drawProgress {
    if (_p > self.progress + 0.01) {
        [_timer invalidate];
        _timer = nil;
        return;
    }
    [self drawProgressCircleWithEndAngle:- M_PI_2 + M_PI * 2* (_p) isGrayCircle:NO];
    _p += 0.05;
}

- (void)drawProgressCircleWithEndAngle:(CGFloat)endAngle isGrayCircle:(BOOL)isGrayCircle  {
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
    CGFloat radius = self.frame.size.width / 2;
    CGFloat startA = -M_PI_2;
    CGFloat endA = endAngle;
    
    CAShapeLayer *layer;
    if(isGrayCircle) {
        layer = self.grayProgressLayer;
    }
    else {
        layer = self.progressLayer;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    layer.path =[path CGPath];
}

- (UILabel *)labProgress {
    if (!_labProgress) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        label.textAlignment = NSTextAlignmentCenter;
        label.center = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
        label.textColor = GreenColor;
        label.font = [UIFont systemFontOfSize:25];
        [self addSubview:label];
        _labProgress = label;
    }
    return _labProgress;
}

- (CAShapeLayer *)grayProgressLayer {
    if(!_grayProgressLayer) {
        _grayProgressLayer = [CAShapeLayer layer];
        _grayProgressLayer.frame = self.bounds;
        _grayProgressLayer.fillColor = [[UIColor clearColor] CGColor];
        _grayProgressLayer.strokeColor = [[UIColor colorWithRed:237/255.0 green:236/255.0 blue:236/255.0 alpha:1] CGColor];
        _grayProgressLayer.opacity = 1;
        _grayProgressLayer.lineCap = kCALineCapRound;
        _grayProgressLayer.lineWidth = 6;
        [self.layer addSublayer:_grayProgressLayer];
    }
    return _grayProgressLayer;
}

- (CAShapeLayer *)progressLayer {
    if(!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor = [[UIColor clearColor] CGColor];
        _progressLayer.strokeColor = [[UIColor colorWithRed:98/255.0 green:200/255.0 blue:166/255.0 alpha:1] CGColor];
        _progressLayer.opacity = 1;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.lineWidth = 6;
        [self.layer addSublayer:_progressLayer];
    }
    return _progressLayer;
}

@end
