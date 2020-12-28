//
//  MYDemoview.h
//  iOSDemos
//
//  Created by WenMingYan on 2020/12/17.
//  Copyright © 2020 MingYan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Callback)(void);

@interface MYDemoview : UIView

@property (nonatomic, strong) NSObject *a;
@property(nonatomic, copy) Callback block;

@end

NS_ASSUME_NONNULL_END
