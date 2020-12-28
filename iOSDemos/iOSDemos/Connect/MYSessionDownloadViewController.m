//
//  MYSessionDownloadViewController.m
//  iOSDemos
//
//  Created by WenMingYan on 2020/12/8.
//  Copyright © 2020 MingYan. All rights reserved.
//

#import "MYSessionDownloadViewController.h"
#import <Masonry/Masonry.h>

@interface MYSessionDownloadViewController ()

@property (nonatomic, strong) UIButton *btn;/**< request btn  */

@end

@implementation MYSessionDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Simple Download";
    [self.view addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)onClickBtn {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://images.pexels.com/photos/4113084/pexels-photo-4113084.jpeg?cs=srgb&dl=pexels-yaroslav-danylchenko-4113084.jpg&fm=jpg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // location是沙盒中tmp文件夹下的一个临时url,文件下载后会存到这个位置,由于tmp中的文件随时可能被删除,所以我们需要自己需要把下载的文件挪到需要的地方
            NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
            // 剪切文件
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:path] error:nil];
        
    }];
    [task resume];
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self
                 action:@selector(onClickBtn)
       forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitle:@"download http" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColor.yellowColor forState:UIControlStateNormal];
    }
    return _btn;
}


@end
