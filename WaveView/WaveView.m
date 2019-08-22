//
//  WaveView.m
//  Vliao
//
//  Created by 张奥 on 2019/8/20.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "WaveView.h"
@interface WaveView()
@property (nonatomic, strong)CAShapeLayer *subLayerOne;
@end
@implementation WaveView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    self = [super init];
    if (self) {
        self.startOpacity = 0.6;
        self.endBordWidth = 25.f;
        self.aniDuration = 2.f;
    }
    return self;
}
-(void)startAnimation{
   
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.subLayerOne = layer;
    layer.bounds = self.bounds;
    layer.opacity = 1.0;
    layer.backgroundColor = [UIColor clearColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = 5;
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:layer];
    
    //动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:self.startOpacity];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = self.aniDuration;
    opacityAnimation.removedOnCompletion = NO;
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    opacityAnimation.repeatCount = MAXFLOAT;
    
    CABasicAnimation *borderAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    borderAnimation.fromValue = @5;
    borderAnimation.toValue = @(self.endBordWidth);
    borderAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    borderAnimation.repeatCount = MAXFLOAT;
    borderAnimation.duration = self.aniDuration;
    borderAnimation.removedOnCompletion = NO;
    [layer addAnimation:opacityAnimation forKey:@"opacity"];
    [layer addAnimation:borderAnimation forKey:@"lineWidth"];
    
}


-(void)stopAniamtion{
    CFTimeInterval pauseTime = CACurrentMediaTime();
    self.subLayerOne.speed = 0;
    self.subLayerOne.timeOffset = pauseTime;
    [self.layer removeAllAnimations];
    [self.subLayerOne removeFromSuperlayer];
}

@end
