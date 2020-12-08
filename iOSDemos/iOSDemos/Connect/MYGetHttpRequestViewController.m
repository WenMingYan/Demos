//
//  MYGetHttpRequestViewController.m
//  iOSDemos
//
//  Created by WenMingYan on 2020/12/8.
//  Copyright © 2020 MingYan. All rights reserved.
//

#import "MYGetHttpRequestViewController.h"
#import <Masonry/Masonry.h>

@interface MYGetHttpRequestViewController () <NSURLSessionDataDelegate>

@property (nonatomic, strong) UIButton *btn;/**< request btn  */

@end

@implementation MYGetHttpRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Get Http";
    [self.view addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)onClickBtn {
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                  delegate:self
                             delegateQueue:[[NSOperationQueue alloc] init]];
    NSURL *url = [NSURL URLWithString:@"http://panyi.xyz:1997/sections"];
    NSURLSessionTask *task = [session dataTaskWithRequest:[NSMutableURLRequest requestWithURL:url]];
    [task resume];
}

#pragma mark - NSURLSessionDataDelegate

/// 1. 接收到服务器的响应
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    if (completionHandler) {
        completionHandler(NSURLSessionResponseAllow);
    }
}

/// 2. 接收到服务器的数据
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {
    // 处理每次接收的数据
}

/// 请求成功或者失败
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error {
    if (error) {
        NSLog(@"request error! error: %@",error);
    }
}


- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self
                 action:@selector(onClickBtn)
       forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitle:@"get http" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColor.yellowColor forState:UIControlStateNormal];
    }
    return _btn;
}

@end
