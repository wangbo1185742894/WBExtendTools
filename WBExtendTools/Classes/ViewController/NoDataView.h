//
//  NoDataView.h
//  CommunityPeople
//
//  Created by 彭睿 on 2019/7/17.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnumTools.h"

NS_ASSUME_NONNULL_BEGIN

static const void * _Nullable kTapViewHandlerKey = @"kTapViewHandlerKey";

@interface NoDataView : UIView <NSCopying>

@property (nonatomic,weak) IBOutlet UIButton *noDataBtn;        //占位图
@property (nonatomic,weak) IBOutlet UILabel *discribeLb;        //描述
@property (nonatomic,weak) IBOutlet UIButton *operBtn;          //操作按钮

@property (nonatomic,strong) void(^TapViewHandler)(void);

- (void)setNoDataType:(NoDataEnum)noDataType;

@end

NS_ASSUME_NONNULL_END
