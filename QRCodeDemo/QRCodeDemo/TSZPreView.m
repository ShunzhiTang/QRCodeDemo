//
//  TSZPreView.m
//  QRCodeDemo
//
//  Created by Tsz on 15/11/14.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZPreView.h"

@interface TSZPreView()

@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIImageView *lineImageView;
@property (nonatomic,strong)NSTimer *timer;

@end

@implementation TSZPreView

/**
 *  layer的类型
 *
 *  @return AVCaptureVideoPreviewLayer 特殊的layer 可以展示输入设备采集到得信息
 */

+ (Class)layerClass{
    return [AVCaptureVideoPreviewLayer class];
}
//set方法
- (void)setSession:(AVCaptureSession *)session{
    _session = session;
    
    AVCaptureVideoPreviewLayer *layer = (AVCaptureVideoPreviewLayer *)self.layer;
    
    layer.session = session;
}

- (instancetype)initWithFrame:(CGRect)  frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
    
}



#pragma mark: 设置 特殊layer的属性
- (void)setupUI{
    
    //设置背景图片
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick_bg.png"]];
    //设置位置到界面的中间
    _imageView.frame = CGRectMake(self.bounds.size.width * 0.5 - 140, self.bounds.size.height * 0.5 - 140, 280, 280);
    //添加到视图上
    [self addSubview:_imageView];
    
    //初始化二维码的扫描线的位置
    
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 220, 2)];
    
    _lineImageView.image = [UIImage imageNamed:@"line.png"];
    [_imageView addSubview:_lineImageView];
    
    //添加定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(animationLine) userInfo:nil repeats:YES];
    

}

//添加线的动画
- (void)animationLine{
    
    [UIView animateWithDuration:3.0 animations:^{
        _lineImageView.frame = CGRectMake(30, 260, 220, 2);
    } completion:^(BOOL finished) {
        _lineImageView.frame = CGRectMake(30, 10, 220, 2);
    }];
}


@end
