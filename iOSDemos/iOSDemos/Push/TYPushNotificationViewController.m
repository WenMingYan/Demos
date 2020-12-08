//
//  TYPushNotificationViewController.m
//  iOSDemos
//
//  Created by WenMingYan on 2020/7/15.
//  Copyright © 2020 MingYan. All rights reserved.
//

#import "TYPushNotificationViewController.h"
#import <Masonry/Masonry.h>

@interface TYPushNotificationViewController ()

@property (nonatomic, strong) UIButton *localPushBtn; /// < 本地消息

@end

@implementation TYPushNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.localPushBtn];
    [self.localPushBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@100);
    }];
}

- (void)onClickLocalPush {
    
}

- (UIButton *)localPushBtn {
    if (!_localPushBtn) {
        _localPushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_localPushBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [_localPushBtn setTitle:@"本地Push" forState:UIControlStateNormal];
        [_localPushBtn addTarget:self action:@selector(onClickLocalPush) forControlEvents:UIControlEventTouchUpInside];
    }
    return _localPushBtn;
}

@end
