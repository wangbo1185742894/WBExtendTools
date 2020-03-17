//
//  UIViewController+NoData.m
//  CommunityPeople
//
//  Created by 彭睿 on 2019/7/17.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import "UIViewController+NoData.h"
#import <objc/runtime.h>

@implementation UIViewController (NoData)

- (void)setNoDataView:(NoDataView *)noDataView
{
    objc_setAssociatedObject(self, kNoDataViewKey, noDataView, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NoDataView *)noDataView
{
    return objc_getAssociatedObject(self,kNoDataViewKey);
}

- (void)showNoData
{
    if (self.noDataView) {
        self.noDataView.hidden = false;
    }else{
        self.noDataView = [[NoDataView alloc]init];
        self.noDataView.frame = self.view.bounds;
        [self.view addSubview:self.noDataView];
    }
    
    DEF_WeakSelf(self);
    [self.noDataView setTapActionWithBlock:^{
        [weakself refreshData];
    }];
}

- (void)hideNoData
{
    [UIView animateWithDuration:0.25 animations:^{
        self.noDataView.alpha = 0;
    } completion:^(BOOL finished) {
        self.noDataView.hidden = true;
        self.noDataView.alpha = 1;
    }];
}

- (void)setNoDataType:(NoDataEnum)noDataType {
    if (!self.noDataView) {
        self.noDataView = [[NoDataView alloc]init];
        self.noDataView.frame = self.view.bounds;
        self.noDataView.hidden = true;
        [self.view addSubview:self.noDataView];
    }
    [self.noDataView setNoDataType:noDataType];
}


- (void)refreshData
{
    
}

@end
