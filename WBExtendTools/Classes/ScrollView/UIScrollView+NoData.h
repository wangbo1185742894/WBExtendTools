//
//  UIScrollView+NoData.h
//  CommunityPeople
//
//  Created by 彭睿 on 2019/11/5.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoDataView.h"

NS_ASSUME_NONNULL_BEGIN

static const void * _Nullable kTableViewNoDataViewKey = @"kTableViewNoDataViewKey";
static const void * _Nullable kTableViewRefrushDataBlockKey = @"kTableViewRefrushDataBlockKey";

@interface UIScrollView (NoData)

@property (nonatomic,strong) NoDataView *noDataView;

@property (nonatomic,strong) void(^refrushDataBlock)(void);

- (void)setNoDataType:(NoDataEnum)noDataType;

- (void)showNoData;

- (void)hideNoData;

@end

NS_ASSUME_NONNULL_END
