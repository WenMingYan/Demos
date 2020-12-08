//
//  MYBookModel.h
//  iOSDemos
//
//  Created by WenMingYan on 2020/7/20.
//  Copyright © 2020 MingYan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYBookModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, assign) NSInteger pageNum;/// < 页数

@end

NS_ASSUME_NONNULL_END
