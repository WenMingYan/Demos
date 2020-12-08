//
//  MYConnectViewController.m
//  iOSDemos
//
//  Created by WenMingYan on 2020/11/25.
//  Copyright © 2020 MingYan. All rights reserved.
//1. 正常data.json传输
//2. 后台传输
//3. TLS握手
//4.

#import "MYConnectViewController.h"
#import <Masonry/Masonry.h>

@interface MYConnectViewController () <UITableViewDelegate, UITableViewDataSource,NSURLSessionDelegate>

@property (nonatomic, strong) UITableView *tableView;/**< tableView  */

@end

@implementation MYConnectViewController


#pragma mark - --------------------dealloc ------------------
#pragma mark - --------------------life cycle--------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    //TODO: wmy 请求网络权限
}

- (void)initData {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)initView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}



#pragma mark - --------------------UITableViewDelegate--------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [[self names] objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self names].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        NSString *title = [[self names] objectAtIndex:indexPath.row];
        NSString *vcString = [self nameDict][title];
    [self.navigationController pushViewController:[[NSClassFromString(vcString) alloc] init] animated:YES];
}

#pragma mark - --------------------NSURLSessionDelegate--------------

#pragma mark - --------------------private methods--------------
#pragma mark - --------------------getters & setters & init members ------------------

- (NSDictionary<NSString *,NSString *> *)nameDict {
    return @{
        @"GetHttp":@"MYGetHttpRequestViewController",
        @"PostHttp":@"MYPostHttpRequestViewController",
        @"HttpDelegate":@"MYHttpDelegateViewController",
    };
}

- (NSArray<NSString *> *)names {
    return @[
        @"GetHttp",
        @"PostHttp",
        @"HttpDelegate",
    ];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



@end
