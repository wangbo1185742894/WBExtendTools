//
//  UIScrollView+Refresh.m
//  CommunityPeople
//
//  Created by 彭睿 on 2019/7/17.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import <objc/runtime.h>

@implementation UIScrollView (Refresh)

- (void)setAnimImgArray:(NSMutableArray *)animImgArray {
    objc_setAssociatedObject(self, kAnimtionImageArrayKey, animImgArray, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSMutableArray *)animImgArray {
    return objc_getAssociatedObject(self,kAnimtionImageArrayKey);
}


- (void)setNoMoreText:(NSString *)noMoreText {
    objc_setAssociatedObject(self, kNoMoreTextKey, noMoreText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)noMoreText {
    return objc_getAssociatedObject(self,kNoMoreTextKey);
}


- (void)setIsRefresh:(BOOL)isRefresh {
    objc_setAssociatedObject(self, kIsRefreshKey, [NSNumber numberWithBool:isRefresh], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)isRefresh {
    NSNumber *num =  objc_getAssociatedObject(self,kIsRefreshKey);
    return num.boolValue;
}


- (void)setIsLoadMore:(BOOL)isLoadMore {
    objc_setAssociatedObject(self, kIsLoadMoreKey, [NSNumber numberWithBool:isLoadMore], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)isLoadMore {
    NSNumber *num =  objc_getAssociatedObject(self,kIsLoadMoreKey);
    return num.boolValue;
}





- (void)refreshCallBack:(void (^)(void))block {
    if (!self || !block || self.isLoadMore == YES) {
        return;
    }
    
    [self.mj_footer resetNoMoreData];
    
    if (self.animImgArray.count > 0) {
        
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            if (self.isLoadMore) {
                [self.mj_header endRefreshing];
            }else{
                self.isRefresh = YES;
                if (block) {
                    block();
                }
            }
        }];
        
        [header setImages:self.animImgArray forState:MJRefreshStateIdle];
        [header setImages:self.animImgArray forState:MJRefreshStateRefreshing];
        header.stateLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        self.mj_header = header;
        
    }else{
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (self.isLoadMore) {
                [self.mj_header endRefreshing];
            }else{
                self.isRefresh = YES;
                if (block) {
                    block();
                }
            }
        }];
        
        [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
        [header setTitle:@"正在更新..." forState:MJRefreshStateRefreshing];
        [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
        header.stateLabel.font = [UIFont systemFontOfSize:13];
        header.stateLabel.textColor = [UIColor blackColor];
        header.lastUpdatedTimeLabel.hidden = YES;
        self.mj_header = header;
    }
}


- (void)loadMoreCallBack:(void(^)(void))block {
    if (self == nil || block == nil || self.isRefresh) {
        return ;
    }

    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (self.isRefresh) {
            [self.mj_footer endRefreshing];
        }else{
            self.isLoadMore = YES;
            if (block) {
                block();
            }
        }
    }];
    
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    [footer setTitle:self.noMoreText ? self.noMoreText : @"没有更多了" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.textColor = [UIColor blackColor];
    footer.stateLabel.font = [UIFont systemFontOfSize:13.f];
    self.mj_footer = footer;
}


- (void)endRefreshLoadMore {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
    self.isRefresh = NO;
    self.isLoadMore = NO;
}

- (void)noMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)resetNoMoreData {
    [self.mj_footer resetNoMoreData];
}

@end
