//
//  UIScrollView+NoData.m
//  CommunityPeople
//
//  Created by 彭睿 on 2019/11/5.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import "UIScrollView+NoData.h"
#import <objc/runtime.h>

@implementation UIScrollView (NoData)

- (void)setNoDataView:(NoDataView *)noDataView
{
    objc_setAssociatedObject(self, kTableViewNoDataViewKey, noDataView, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NoDataView *)noDataView
{
    return objc_getAssociatedObject(self,kTableViewNoDataViewKey);
}

- (void)setRefrushDataBlock:(void (^)(void))refrushDataBlock {
    objc_setAssociatedObject(self, kTableViewRefrushDataBlockKey, refrushDataBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))refrushDataBlock {
    return objc_getAssociatedObject(self,kTableViewRefrushDataBlockKey);
}

- (void)showNoData
{
    if (self.noDataView) {
        self.noDataView.hidden = false;
    }else{
        self.noDataView = [[NoDataView alloc]init];
        self.noDataView.frame = self.bounds;
        [self addSubview:self.noDataView];
    }
    
    DEF_WeakSelf(self);
    [self.noDataView setTapActionWithBlock:^{
        if (weakself.refrushDataBlock) {
            weakself.refrushDataBlock();
        }
    }];
}

- (void)hideNoData
{
    [UIView animateWithDuration:0.25 animations:^{
        self.noDataView.alpha = 0;
    } completion:^(BOOL finished) {
        self.noDataView.hidden = true;
        self.noDataView.alpha = 1;
//        [[CommonTools topViewController] hideNoData];
    }];
}

- (void)setNoDataType:(NoDataEnum)noDataType {
    if (!self.noDataView) {
        self.noDataView = [[NoDataView alloc]init];
        self.noDataView.frame = self.bounds;
        self.noDataView.hidden = true;
        [self addSubview:self.noDataView];
    }
    [self.noDataView setNoDataType:noDataType];
}


@end
