//
//  MYSessionPostViewController.m
//  iOSDemos
//
//  Created by WenMingYan on 2020/12/8.
//  Copyright © 2020 MingYan. All rights reserved.
//

#import "MYSessionPostViewController.h"
#import <Masonry/Masonry.h>

@interface MYSessionPostViewController ()

@property (nonatomic, strong) UIButton *btn;/**< request btn  */

@end

@implementation MYSessionPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"POSt Http";
    [self.view addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)onClickBtn {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://panyi.xyz:1997/sections"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response: \n %@",[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]);
    }];
    [task resume];
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self
                 action:@selector(onClickBtn)
       forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitle:@"Post http" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColor.yellowColor forState:UIControlStateNormal];
    }
    return _btn;
}

@end
