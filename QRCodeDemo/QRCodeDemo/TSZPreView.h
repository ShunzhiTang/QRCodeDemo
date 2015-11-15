//
//  TSZPreView.h
//  QRCodeDemo
//
//  Created by Tsz on 15/11/14.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface TSZPreView : UIView

//需要一个会话  session
@property (nonatomic ,strong)AVCaptureSession *session;
@end
