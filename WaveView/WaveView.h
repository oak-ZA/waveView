//
//  WaveView.h
//  Vliao
//
//  Created by 张奥 on 2019/8/20.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveView : UIView
//开始的透明度
@property (nonatomic, assign)CGFloat startOpacity;
//放大的宽度
@property (nonatomic, assign)CGFloat endBordWidth;
//动画时间
@property (nonatomic, assign)CGFloat aniDuration;
-(void)startAnimation;
-(void)stopAniamtion;
@end
