//
//  MYAutoLayoutViewController.m
//  iOSDemos
//
//  Created by WenMingYan on 2020/12/17.
//  Copyright © 2020 MingYan. All rights reserved.
//

#import "MYAutoLayoutViewController.h"
#import "MYDemoview.h"

@interface MYAutoLayoutViewController ()

@property (nonatomic, strong) MYDemoview *demoView;

@end

@implementation MYAutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    MYDemoview *demoView = [MYDemoview new];
    demoView.a = [NSObject new];
    NSLog(@"1out a = %p",demoView.a);
    demoView.block = ^{
        NSLog(@"in a = %p",demoView.a);
    };
    demoView.a = [NSObject new];
    NSLog(@"2out a = %p",demoView.a);
    demoView.block();
}


@end
