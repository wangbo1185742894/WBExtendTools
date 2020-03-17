//
//  NoDataView.m
//  CommunityPeople
//
//  Created by 彭睿 on 2019/7/17.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import "NoDataView.h"
#import "UIView+Tap.h"

#define imageWidth DEF_SCREEN_WIDTH * 0.4

@implementation NoDataView 


- (instancetype)init {
    if (self = [super init]) {
        self = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    }
    return self;
}


- (id)copyWithZone:(NSZone *)zone {
    NoDataView *view = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return view;
}


- (void)setTapActionWithBlock:(void(^)(void))block {
    objc_setAssociatedObject(self, kTapViewHandlerKey,block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))TapViewHandler {
    return objc_getAssociatedObject(self,kTapViewHandlerKey);
}


- (void)setNoDataType:(NoDataEnum)noDataType {
    switch (noDataType) {
        case NoDataEnumNotNetwork:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_network"] forState:0];
            _discribeLb.text = @"哎呀，网络开小差了";
            [_operBtn setTitle:@"刷新" forState:0];
            _operBtn.hidden = false;
            
            break;
        case NoDataEnumGoodsList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_goods"] forState:0];
            _discribeLb.text = @"一个商品也没有";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumOrderList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_order"] forState:0];
            _discribeLb.text = @"一个订单也没有，快去逛逛吧";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumShoppingCarList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_shoppingcar"] forState:0];
            _discribeLb.text = @"空空如也，快去加购吧～";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumAddressList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_address"] forState:0];
            _discribeLb.text = @"还没有收货地址";
            [_operBtn setTitle:@"  新建收货地址  " forState:0];
            _operBtn.hidden = false;
            
            break;
        case NoDataEnumCouponList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_coupon"] forState:0];
            _discribeLb.text = @"还没有优惠券";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumCardList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_card"] forState:0];
            _discribeLb.text = @"还没有卡片";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumFavoriteGoodsList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_favocite_goods"] forState:0];
            _discribeLb.text = @"还没有收藏过商品";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumFavoriteShopList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_favocite_shop"] forState:0];
            _discribeLb.text = @"还没有收藏过店铺";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumEvaluateList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_evaluate"] forState:0];
            _discribeLb.text = @"还没有评价记录";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumConversionList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_conversion"] forState:0];
            _discribeLb.text = @"还没有兑换记录";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumTopUpList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_topup"] forState:0];
            _discribeLb.text = @"还没有充值记录";
            _operBtn.hidden = true;
            
            break;
        case NoDataEnumSearchList:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_search"] forState:0];
            _discribeLb.text = @"什么都没搜到，换个词试试吧～";
            _operBtn.hidden = true;
            
            break;
        default:
            
            [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"ic_not_normal"] forState:0];
            _discribeLb.text = @"空空如也～";
            [_operBtn setTitle:@"刷新" forState:0];
            _operBtn.hidden = false;
            
            break;
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.TapViewHandler && _operBtn.hidden == true) {
        self.TapViewHandler();
    }
}


- (IBAction)clickOper {
    if (self.TapViewHandler) {
        self.TapViewHandler();
    }
}


@end
