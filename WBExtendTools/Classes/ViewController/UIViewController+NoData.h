//
//  UIViewController+NoData.h
//  CommunityPeople
//
//  Created by 彭睿 on 2019/7/17.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoDataView.h"

NS_ASSUME_NONNULL_BEGIN

static const void * _Nullable kNoDataViewKey = @"kNoDataViewKey";
static const void * _Nullable kNoDataTypeKey = @"kNoDataTypeKey";

@interface UIViewController (NoData)

@property (nonatomic,strong) NoDataView *noDataView;

- (void)setNoDataType:(NoDataEnum)noDataType;

/**
 显示空数据页面
 */
- (void)showNoData;

/**
 隐藏空数据页面
 */
- (void)hideNoData;

/**
 点击刷新数据（主类实现）
 */
- (void)refreshData;

@end

NS_ASSUME_NONNULL_END
