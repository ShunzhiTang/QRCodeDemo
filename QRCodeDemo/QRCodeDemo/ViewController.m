//
//  ViewController.m
//  QRCodeDemo
//
//  Created by Tsz on 15/11/14.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "TSZPreView.h"
@interface ViewController () <AVCaptureMetadataOutputObjectsDelegate>

//1、输入设备(从外界采集信息)  输入设备很多种  摄像头  麦克风  键盘
@property (nonatomic ,strong) AVCaptureDeviceInput *input;

//2、输出设备 (解析采集来得内容 然后获取到数据) Metadata 元数据
@property (nonatomic ,strong)AVCaptureMetadataOutput *output;

//3、会话 session (连接输入和输出进行工作)
@property (nonatomic,strong)AVCaptureSession *session;

//4、layer  (特殊的layer  展示输入设备采集到的信息)
@property (nonatomic , strong) TSZPreView *preview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)prepareQRCode{
    //1.输入设备(从外界采集信息)
    //创建具体的设备  摄像头
    //AVMediaTypeVideo  摄像头       AVMediaTypeAudio 麦克风
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    self.input = [AVCaptureDeviceInput  deviceInputWithDevice:device error:NULL];
    
     //2.输出设备 (解析采集来得内容 然后获取到数据) Metadata 元数据
    
    self.output = [[AVCaptureMetadataOutput alloc] init];
    //3、会话
    self.session = [[AVCaptureSession alloc] init];
    
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    // 4、把input  output 设备添加到session
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }
    
    //5、指定输出设备的 代理   来返回 解析到得数据
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //6、设置元数据类型 QRCode 二维码
    
    [self.output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    
    //7、展示到layer
    TSZPreView *preView = [[TSZPreView alloc] initWithFrame:self.view.bounds];
    
    preView.session = self.session;
    
    [self.view addSubview:preView];
    
    
    //8、开启会话
    [self.session startRunning];
    
}



#pragma mark: AVCaptureMetadataOutputObjectsDelegate的 一个协议方法
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    NSLog(@"------");
}

@end
