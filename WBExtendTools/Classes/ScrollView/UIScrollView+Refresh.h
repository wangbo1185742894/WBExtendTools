//
//  UIScrollView+Refresh.h
//  CommunityPeople
//
//  Created by 彭睿 on 2019/7/17.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

static const void * _Nullable kAnimtionImageArrayKey = @"kAnimtionImageArrayKey";
static const void * _Nullable kNoMoreTextKey = @"kNoMoreTextKey";
static const void * _Nullable kIsRefreshKey = @"kIsRefreshKey";
static const void * _Nullable kIsLoadMoreKey = @"kIsLoadMoreKey";

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Refresh)


/**
 自定义刷新动画图片数组
 */
@property (nonatomic, copy) NSMutableArray *animImgArray;

/**
 没有更多数据时底部显示的提示
 */
@property (nonatomic, copy) NSString *noMoreText;

/**
 正在下拉刷新
 */
@property (nonatomic, assign) BOOL isRefresh;

/**
 正在上拉加载
 */
@property (nonatomic, assign) BOOL isLoadMore;


/**
 下拉刷新
 @param block 刷新回调
 */
- (void)refreshCallBack:(void(^)(void))block;

/**
 上拉加载
 @param block 刷新回调
 */
- (void)loadMoreCallBack:(void(^)(void))block;

/**
 结束刷新加载
 */
- (void)endRefreshLoadMore;

/**
 显示没有更多内容
 */
- (void)noMoreData;

/**
 重置footer状态
 */
- (void)resetNoMoreData;

@end

NS_ASSUME_NONNULL_END
