//
//  ViewController.m
//  WaveView
//
//  Created by 张奥 on 2019/8/22.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ViewController.h"
#import "WaveView.h"
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic, strong)WaveView *wave;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    WaveView *wave = [[WaveView alloc] init];
    wave.backgroundColor = [UIColor clearColor];
    self.wave = wave;
    [self.view addSubview:wave];
    [wave mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(@100.f);
    }];
    [wave layoutIfNeeded];
    
    UIView *v = [[UIView alloc] init];
    v.layer.masksToBounds = YES;
    v.layer.cornerRadius = 100.f/2;
    v.backgroundColor = [UIColor greenColor];
    [self.view addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(@100.f);
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, 100, 80, 80);
    [button setTitle:@"开始" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8.f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(200, 100, 80, 80);
    [button2 setTitle:@"停止" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor blueColor];
    button2.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.layer.cornerRadius = 8.f;
    button2.layer.masksToBounds = YES;
    [button2 addTarget:self action:@selector(clickButton2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

-(void)clickButton1{
    [self.wave startAnimation];
}
-(void)clickButton2{
    [self.wave stopAniamtion];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
